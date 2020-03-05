class DealerHandCard < ApplicationRecord
  belongs_to :dealer_hand
  belongs_to :card

  def card_to_number
    if self.card[:value].to_i != 0
      card_value = self.card[:value].to_i
    elsif self.card[:value] == "A"
      card_value = 11
    else self.card[:value] = 10
    end
  end
  
end
