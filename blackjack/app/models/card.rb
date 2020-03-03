class Card < ApplicationRecord
  has_many :dealer_hand_cards
  has_many :player_hand_cards
end
