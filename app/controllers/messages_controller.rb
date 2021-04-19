class MessagesController < ApplicationController

    before_action :require_login, only: [:create]
    def create
        # byebug;
        # render plain: params[:message]
        # alert("Aa Geya");

        message = current_user.messages.build(message_params);
        if message.save
            #   redirect_to root_path;
            # byebug;
            ActionCable.server.broadcast("chat_channel", {mod_msg: message_render(message)});
            # scroll_bottom();
            
        end
    end

    private 

    def message_params
        params.require(:message).permit(:body);
    end

    def message_render(message)
        # rendering a partial "message" which needs local variable "message", and that we are passing.
        render(partial: 'message', locals: {message: message});
    end

end

