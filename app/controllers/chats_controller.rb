class ChatsController < ApplicationController
    before_action :require_login, only:[:index];
    def index
        # byebug; 
        @message = Message.new();
        @messages = Message.custom_display;
    end
  
end