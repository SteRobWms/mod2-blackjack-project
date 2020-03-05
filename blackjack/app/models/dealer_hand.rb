class DealerHand < ApplicationRecord
  belongs_to :dealer
  belongs_to :game
  has_many :dealer_hand_cards
  has_many :cards, through: :dealer_hand_cards

  def deal_card
    DealerHandCard.create(dealer_hand_id: self.id, card_id: self.game.draw_unique_card.id)
  end

  def card_values
    self.dealer_hand_cards.map do |hand_card|
      # card_to_number is a dealer_hand_card method (same for dealer_hand_card)
      hand_card.card_to_number
    end
  end

  # 
  def set_blackjack
    # Conditions for blackjack are two cards that add to 21
    if self.card_values.length == 2 && self.hand_value == 21
      self.update(blackjack?: true)
    end
  end

  def hand_value
    temp_array = self.card_values
    if temp_array.sum > 21
      # test for aces (as value  = 11) and convert them from 11 to 1 until either there are no more 11s 
      while ace = temp_array.index(11) && temp_array.sum > 21
        ace = temp_array.index(11)
        temp_array[ace] = 1
      end
      temp_array.sum
    else
      temp_array.sum
    end
  end

end
