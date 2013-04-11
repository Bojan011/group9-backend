class UsersController < ApplicationController
	def index
		#user controller
		render json: User.all.to_json
	end
end