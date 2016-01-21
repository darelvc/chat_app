class MessagesController < ApplicationController
    before_action :authenticate_user!
    
    
	def create
		@chat = Chat.find(params[:chat_id])
		@message = Message.create(params[:message].permit(:content))
		@message.user_id = current_user.id
		@message.chat_id = @chat.id

		if @message.save
			redirect_to chat_path(@chat), notice: "Комментарий добавлен успешно"
		else
			render 'new'
		end
	end
end
