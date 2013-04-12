class UsersController < ApplicationController
	def index
		#user controller
		if params[:id]
			begin
				user = User.find(params[:id])
				render json: user
			rescue
				render :text=>"{'ERROR':'Invalid User ID'}"
			end
		else
			render json: User.all.to_json
		end
	end
end