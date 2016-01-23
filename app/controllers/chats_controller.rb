class ChatsController < ApplicationController
  before_action :find_chat, only: [:show, :edit, :update, :destroy]
  
  def index
    @chats = Chat.all.order("created_at DESC")
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
  		redirect_to @chat, notice: "Hellz yeah! Your chat was successfully saved!"
  	else
  		render 'new', notice: "Oh no! I was unable to save your chat."
  	end
  end
  
  def edit
  end
  
  def update
    if @chat.update(chat_params)
      redirect_to @chat, notice: "Your chat was updates successfully"
    else
      render 'edit'
    end
  end
  
  def destroy
    @chat.destroy
    redirect_to chats_path, notice: "You Destroy Chat"
  end

private

  def chat_params
  	params.require(:chat).permit(:title, :private, :slug)
  end
  
  def find_chat
  	@chat = Chat.find(params[:id])
  end

end
