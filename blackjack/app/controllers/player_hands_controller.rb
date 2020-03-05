class PlayerHandsController < ApplicationController

    def stand
        @current_hand = PlayerHand.find(params[:id])
        @current_hand.update(active: false)
        redirect_to edit_game_path(@current_hand.game)
    end

    def update
        @current_hand = PlayerHand.find(params[:id])
        @current_hand.deal_card
        card_ids = @current_hand.player_hand_cards.pluck(:card_id)
        card_values = Card.find(card_ids).pluck(:value)
        if @current_hand.hand_value > 21
        # if @current_hand.hands(card_values).sum > 21 
            @current_hand.update(active: false)
        end
        redirect_to edit_game_path(@current_hand.game)
    end

    private
    def player_hand_params
        params.require(:player_hand).permit(:player_id, :game_id)
    end

end
