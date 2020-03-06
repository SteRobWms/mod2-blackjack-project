class DealerHandsController < ApplicationController

    def update
        @current_hand = DealerHand.find(params[:id])
        if @current_hand.hand_value <= 16
            @current_hand.deal_card
            if @current_hand.hand_value > 16
                @current_hand.update(active: false)
            end
        else
            @current_hand.update(active:false)
        end
        redirect_to edit_game_path(@current_hand.game)
    end

    private
    def dealer_hand_params
        params.require(:dealer_hand).permit(:dealer_id, :game_id)
    end
end
