class PlayerHandsController < ApplicationController

    def update
        @current_hand = PlayerHand.find(params[:id])
        @current_hand.deal_card
        redirect_to edit_game_path(@current_hand.game)
    end

    private
    def player_hand_params
        params.require(:player_hand).permit(:player_id, :game_id)
    end

end
