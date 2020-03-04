class GamesController < ApplicationController
  before_action :current_game, only: [:show]
  
  def new
    @game = Game.new
    @players = Player.all

  end

  def create
    byebug
    @game = Game.new(game_params)
  end

  def show
  end

  def card_to_numbers(card)
    if card[:value].to_i
      card_value = card[:value].to_i
    elsif card[:value] == "A"
      card_value = 11
    else card[:value] = 10
    end
  end

  private
  def current_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:min_bet, :max_bet, :players)
  end

  def who_won(hand_1, hand_2)
    
  end
  

end
