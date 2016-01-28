class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_user, only: [:edit, :update, :show]

	def index

	end

	def show
		#@recipes = current_chef.recipes.find(params[:id])
		@chat = Chat.find(params[:id])
		@chats = Chat.all.order("created_at DESC")
	end
	
	private
	
	def set_user
		@user = User.find(params[:id])
	end

end