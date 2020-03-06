class PlayerHand < ApplicationRecord
  belongs_to :player
  belongs_to :game
  has_many :player_hand_cards
  has_many :cards, through: :player_hand_cards

  validates :bet, presence: true

  def deal_card
    PlayerHandCard.create(player_hand_id: self.id, card_id: self.game.draw_unique_card.id)
  end

  # def pay_bank
  #   self.player.bank += :payout*:bet
  # end

  # def stand
  #   active = false
  # end

  def card_values
    self.player_hand_cards.map do |hand_card|
      # card_to_number is a player_hand_card method (same for dealer_hand_card)
      hand_card.card_to_number
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
  
  def set_blackjack
    # Conditions for blackjack are two cards that add to 21
    if self.card_values.length == 2 && self.hand_value == 21
      self.update(blackjack?: true)
    end
  end
  
  def outcome
    dealer_hand = self.game.dealer_hand
    
    # update blackjack? boolean value in objects (dealer_hand, player_hand)
    self.set_blackjack
    dealer_hand.set_blackjack

    # tests and returns string of outcome
    if dealer_hand.blackjack?
      if self.blackjack?
        return "push"
      else
        return "dealer blackjack"
      end
    elsif self.blackjack?
      return "blackjack"
    elsif self.hand_value > 21
      return "bust"
    elsif dealer_hand.hand_value > 21
      return "win"
    elsif dealer_hand.hand_value == self.hand_value
      return "push"
    elsif dealer_hand.hand_value > self.hand_value
      return "loss"
    else
      return "win"
    end
  end

  def payout_chart
    payout_chart = {
      "dealer blackjack" => 0,
      "loss" => 0,
      "bust" => 0,
      "push" => 1,
      "win" => 2,
      "blackjack" => 2.5
    }
  end

  def payout
    if pay_multiplier = self.payout_chart[self.outcome]
      pay_multiplier*self.bet
    end
  end
end
