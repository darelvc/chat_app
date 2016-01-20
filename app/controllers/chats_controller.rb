class ChatsController < ApplicationController
  before_action :find_chat, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def show
  end
  
  def new
  	@chat = Chat.new
  end
  
  def create
  	@chat = Chat.new chat_params
  
  	if @chat.save
  		redirect_to @chat, notice: "Hellz yeah, Mackenzie! Your article was successfully saved!"
  	else
  		render 'new', notice: "Oh no, Mackenzie! I was unable to save your post."
  	end
  end

private

  def chat_params
  	params.require(:chat).permit(:title, :private, :slug)
  end
  
  def find_chat
  	@chat = Chat.find(params[:id])
  end

end
