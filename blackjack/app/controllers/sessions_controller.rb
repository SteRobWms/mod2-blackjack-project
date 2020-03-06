class SessionsController < ApplicationController

  skip_before_action :authenticated , only: [:new, :create]

  def new
    session.delete :player_id
  end

  def create 
    @player = Player.find_by(username: params[:username])
    if @player && @player.authenticate(params[:password])
      session[:player_id] = @player.id 
      # session[:bet] = 10
      redirect_to @player
    else
      flash[:login_error] = ["Invalid user name or password"]
      redirect_to login_path
    end
  end

  def destroy
    session.delete :player_id
    redirect_to login_path
  end 
end
