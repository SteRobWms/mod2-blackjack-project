class PlayerHandCard < ApplicationRecord
  belongs_to :player_hand
  belongs_to :card
end
