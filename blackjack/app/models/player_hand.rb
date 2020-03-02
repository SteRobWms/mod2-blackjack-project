class PlayerHand < ApplicationRecord
  belongs_to :player
  belongs_to :game
  has_many :player_hand_cards
  has_many :cards, through: :player_hand_cards
end
