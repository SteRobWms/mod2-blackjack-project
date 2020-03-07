class DealerHandsController < ApplicationController

    def show 
        @current_hand = DealerHand.find(params[:id])
        if @current_hand.hand_value <= 16 && !@current_hand.game.player_hands.first.active
            @current_hand.deal_card
        end
        redirect_to edit_game_path(@current_hand.game)
    end

    # def edit 
    # end

    # def update
    #     @current_hand = DealerHand.find(params[:id])
    #     if @current_hand.hand_value <= 16
    #         @current_hand.deal_card
    #     # else
    #         # @current_hand.update(active:false)
    #     end
    #     redirect_to edit_game_path(@current_hand.game)
    # end

    private
    def dealer_hand_params
        params.require(:dealer_hand).permit(:dealer_id, :game_id)
    end
end
