class MailboxsController < ApplicationController	
  def inbox
    @mail_box = current_user.mailbox.inbox
    
    if @mail_box.present?
	    inbox = @mail_box.map do |mail|
	    	{:id=>mail.id, :created_at => mail.created_at, :is_unread=> is_unread? mail.receipts, :sender=> mail.last_message.sender.name }
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
    @mail_box = current_user.mailbox.sentbox
    if @mail_box.present?
	    sentbox = @mail_box.map do |mail|
	    	{:id=>mail.id, :created_at => mail.created_at, :is_unread=> is_unread? mail.receipts, :sender=> mail.last_message.sender.name}
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
  	@mail_box = current_user.mailbox.trash
	  
	  if @mail_box.present?
	    trashbox = @mail_box.map do |mail|
	    	{:id=>mail.id, :created_at => mail.created_at, :is_unread=> is_unread? mail.receipts, :sender=> mail.last_message.sender.name}
	    end
	    json = trashbox.to_json 
    
    	render 	:status => 200,
					   	:json => { :success => true,
			                :info => "trashbox",
			                :data => { :trashbox => json } }
    end
  end

  def is_unread? receipts
  	receipts.each do |recept|
  		return true if recept.is_unread?
  	end
  	return false
  end
end
