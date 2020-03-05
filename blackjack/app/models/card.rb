class Card < ApplicationRecord
  has_many :dealer_hand_cards
  has_many :player_hand_cards

  def card_to_numbers
    if self[:value].to_i != 0
      card_value = self[:value].to_i
    elsif self[:value] == "A"
      card_value = 11
    else self[:value] = 10
    end
  end
 
end
