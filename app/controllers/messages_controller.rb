class MessagesController < ApplicationController
    def new
    @message = current_user.message.build
    end
end
