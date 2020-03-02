class DealerHand < ApplicationRecord
  belongs_to :dealer
  belongs_to :game
  has_many :dealer_hand_cards
  has_many :cards, through: :dealer_hand_cards
end
