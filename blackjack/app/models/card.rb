class Card < ApplicationRecord
  belongs_to :deck
  has_many :dealer_hand_cards
  has_many :player_hand_cards
end
