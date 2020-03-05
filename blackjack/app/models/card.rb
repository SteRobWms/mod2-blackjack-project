class Card < ApplicationRecord
  has_many :dealer_hand_cards
  has_many :player_hand_cards

  def written_name
    "#{self.value} of #{self.suit[-2]}"
  end

end
