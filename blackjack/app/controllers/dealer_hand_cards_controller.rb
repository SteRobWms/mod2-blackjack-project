class DealerHandCardsController < ApplicationController

    def update
    end

    private
    def dealer_hand_card_params
        params.require(:dealer_hand_card).permit(:dealer_hand_id, :card_id)
    end

end
