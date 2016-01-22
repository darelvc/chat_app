class MessagesController < ApplicationController
    before_action :authenticate_user!
    
    
	def create
		@chat = Chat.find(params[:chat_id])
		@message = Message.create(params[:message].permit(:content))
		@message.user_id = current_user.id
		@message.chat_id = @chat.id
		
		respond_to do |format|
			if @message.save
				format.js do
					PrivatePub.publish_to "/chats/#{@chat.id}/messages", message: @message.to_json
				#redirect_to chat_path(@chat), notice: "Комментарий добавлен успешно"
					render nothing: true
				end
				#format.html {redirect_to chat_path(@chat), notice: "Комментарий добавлен успешно"}
			else
				format.js do
					PrivatePub.publish_to "/chats/#{@chat.id}/messages", errors: @messages.errors.full_messages
					render nothing: true
					#render 'new'
				end
			end
		end
	end
end
