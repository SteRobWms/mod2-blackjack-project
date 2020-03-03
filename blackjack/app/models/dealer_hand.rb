class DealerHand < ApplicationRecord
  belongs_to :dealer
  belongs_to :game
  has_many :dealer_hand_cards
  has_many :cards, through: :dealer_hand_cards

  def hand_value
    value_array = self.dealer_hand_cards.map do |hand_card|
      hand_card.card.card_to_numbers
    end
    value_array.sum
  end

end
