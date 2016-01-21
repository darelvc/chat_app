class ChatsController < ApplicationController
  before_action :find_chat, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def show
    @messages = Message.where(chat_id: @chat)
  end
  
  def new
  	@chat = current_user.chats.build
  end
  
  def create
  	@chat = current_user.chats.build chat_params
  
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
