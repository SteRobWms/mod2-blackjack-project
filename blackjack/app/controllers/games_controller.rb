class GamesController < ApplicationController
  before_action :current_game, only: [:show, :edit, :update]
  
  def show
  end
  
  def new
    @game = Game.new
    @players = Player.all
    @dealers = Dealer.all
  end

  def create
    @game = Game.create(min_bet: game_params[:min_bet], max_bet: game_params[:max_bet])
    @player_hand = PlayerHand.create(game_id: @game.id, bet: game_params[:bet], player_id: game_params[:player_id])
    @dealer_hand = DealerHand.create(game_id: @game.id, dealer_id: game_params[:dealer_id])
    2.times do 
      @dealer_hand.deal_card
      @player_hand.deal_card
    end

    redirect_to edit_game_path(@game)
  end

  def edit
    @player_hand = @game.player_hands.first
    @player = @player_hand.player
    @player_hand_cards = @player_hand.player_hand_cards
    @dealer_hand = @game.dealer_hand
    @dealer = @dealer_hand.dealer
    @dealer_hand_cards = @dealer_hand.dealer_hand_cards
  end

  def update
    byebug
  end

  private
  def current_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:bet, :min_bet, :max_bet, :player_id, :dealer_id)
  end
  
end
