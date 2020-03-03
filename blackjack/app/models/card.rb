class Card < ApplicationRecord
  belongs_to :deck
  has_many :dealer_hand_cards
  has_many :player_hand_cards

  def card_to_numbers(card)
    if card[:value].to_i
      card_value = card[:value].to_i
    elsif card[:value] == "A"
      card_value = 11
    else card[:value] = 10
    end
  end
end
