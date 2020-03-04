class PlayersController < ApplicationController

  before_action :current_player, only: [:show, :edit]

  def show

  end

  def new
    @player = Player.new
  end

  def create 
    if @player.save
      redirect_to "/login"
    else
      render "new"
    end
  end

  def edit

  end

  def update 
    if @player.update(player_params)
      redirect_to @player
    else 
      flash[:errors] = @player.errors.full_messages
      render "edit"
    end
  end

  private 
    def player_params 
      params.require(:player).permit(:name, :age)
    end

    def current_player 
      @player = Player.find(params[:id])
    end
end
