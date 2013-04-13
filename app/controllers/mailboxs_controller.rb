class MailboxsController < ApplicationController	

  def inbox
  	current_user = User.find_by_authentication_token(params[:token])
    @mail_box = current_user.mailbox.inbox if current_user.present?
    
    if @mail_box.present?
	    inbox = @mail_box.map do |mail|
	    	id = mail.id
	    	created_at = mail.created_at
	    	is_unread = unread?(mail)
	    	sender = mail.last_message.sender.name 
	    	{:id=>id, :created_at => created_at, :is_unread=> is_unread, :sender=> sender}
	    end
	    json = inbox.to_json 
    	render 	:status => 200,
					   	:json => { :success => true,
			                :info => "inbox",
			                :data => { :inbox => json } }
    end
  end

  def drafts
  end

  def sent
    current_user = User.find_by_authentication_token(params[:token])
    @mail_box = current_user.mailbox.sentbox if current_user.present?
    
    if @mail_box.present?
	    sentbox = @mail_box.map do |mail|
				id = mail.id
	    	created_at = mail.created_at
	    	sender = mail.last_message.sender.name 
	    	{ :id=>id, :created_at => created_at, :is_unread=> is_unread }
	    end
	    json = sentbox.to_json 
	    
	    render 	:status => 200,
					   	:json => { :success => true,
			                :info => "sentbox",
			                :data => { :sentbox => json } }
    end
  end

  def outbox
  end

  def trash
  	current_user = User.find_by_authentication_token(params[:token])
    @mail_box = current_user.mailbox.trash if current_user.present?
    
	  
	  if @mail_box.present?
	    trashbox = @mail_box.map do |mail|
				id = mail.id
	    	created_at = mail.created_at
	    	sender = mail.last_message.sender.name 
	    	{:id=>id, :created_at => created_at, :sender=> sender}
	    end
	    json = trashbox.to_json 
    
    	render 	:status => 200,
					   	:json => { :success => true,
			                :info => "trashbox",
			                :data => { :trashbox => json } }
    end
  end

	def unread? inbox_mail
    inbox_mail.receipts.inbox.each do |rm|
      return true if rm.is_unread? and rm.message.sender != current_user
    end
    return false
  end 
end
