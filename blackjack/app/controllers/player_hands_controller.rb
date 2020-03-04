class PlayerHandsController < ApplicationController

    def update
    end

    private
    def player_hand_params
        params.require(:player_hand).permit(:player_id, :game_id)
    end

end
