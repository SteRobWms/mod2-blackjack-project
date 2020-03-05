class PlayerHandCardsController < ApplicationController
    
    def update
    end

    private
    def player_hand_card_params
        params.require(:player_hand_card).permit(:player_id, :game_id)
    end

end
