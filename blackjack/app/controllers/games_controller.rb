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
    # @game = Game.new(min_bet: 10, max_bet: 50)
    # @players = Player.all
    # @dealers = Dealer.all
  end

  def create
    @game = Game.create(min_bet: 10, max_bet: 50)
    @dealer = Dealer.first
    @player_hand = PlayerHand.create(game_id: @game.id, player_id: session[:player_id])
    if params[:bet]
      @player_hand.update(bet: params[:bet].to_i)
    else @player_hand.update(bet: @game[:min_bet])
    end
    @dealer_hand = DealerHand.create(game_id: @game.id, dealer_id: @dealer.id)
    @player.update(:bank => @player.bank - @player_hand.bet)
    2.times{@dealer_hand.deal_card}
    2.times{@player_hand.deal_card}
    redirect_to edit_game_path(@game)
  end

  def edit
    @player_hand = @game.player_hands.first
    @player = @player_hand.player
    @player_hand_cards = @player_hand.player_hand_cards
    @dealer_hand = @game.dealer_hand
    @dealer = @dealer_hand.dealer
    @dealer_hand_cards = @dealer_hand.dealer_hand_cards
    if @dealer_hand.hand_value > 16
      @dealer_hand.update(active: false)
      @player.update(bank: (@player.bank += @player_hand.payout))
    end
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
