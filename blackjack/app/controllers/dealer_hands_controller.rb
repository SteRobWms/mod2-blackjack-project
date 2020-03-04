class DealerHandsController < ApplicationController

    def update
    end

    private
    def dealer_hand_params
        params.require(:dealer_hand).permit(:dealer_id, :game_id)
    end
end
