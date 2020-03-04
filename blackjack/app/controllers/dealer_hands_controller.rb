class DealerHandsController < ApplicationController

    def update
        @current_hand = DealerHand.find(params[:id])
        @current_hand.deal_card
        redirect_to edit_game_path(@current_hand.game)
    end

    private
    def dealer_hand_params
        params.require(:dealer_hand).permit(:dealer_id, :game_id)
    end
end
