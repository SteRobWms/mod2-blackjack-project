class GamesController < ApplicationController
  before_action :current_game, only: [:show, :edit, :update]
  
  def show
    @player_hand = @game.player_hands.first
    @player = @player_hand.player
    @player_hand_cards = @player_hand.player_hand_cards
    @dealer_hand = @game.dealer_hand
    @dealer = @dealer_hand.dealer
    @dealer_hand_cards = @dealer_hand.dealer_hand_cards
  end
  
  def new
    @game = Game.new(min_bet: 10, max_bet: 50)
    @players = Player.all
    @dealers = Dealer.all
  end

  def create
    @game = Game.create(min_bet: 10, max_bet: 50)
    @player_hand = PlayerHand.new(game_id: @game.id, bet: game_params[:bet], player_id: session[:player_id])
    if @player_hand.valid?
      @player_hand.save
      @dealer_hand = DealerHand.create(game_id: @game.id, dealer_id: game_params[:dealer_id])
      2.times{@dealer_hand.deal_card}
      2.times{@player_hand.deal_card}
      redirect_to edit_game_path(@game)
    else
      @game.destroy
      flash[:error] = @player_hand.errors.full_messages
      redirect_to new_game_path
    end

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
    @player
  end

  private
  def current_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:bet, :min_bet, :max_bet, :player_id, :dealer_id)
  end

  def winnings_params
    params.require(:game).permit(:winnings[])
  end
  
end
