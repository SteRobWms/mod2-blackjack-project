class ApplicationController < ActionController::Base

    # before_action :authenticated

    def current_player
        if session[:player_id]
           @player = Player.find(session[:player_id])
        else
        
        end
    end

    def logged_in?
        !!current_player
    end

    def authenticated
        redirect_to login_path unless logged_in?
    end

    def login
        redirect_to login_path
    end
end
