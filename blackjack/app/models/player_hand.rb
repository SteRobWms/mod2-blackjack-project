class PlayerHand < ApplicationRecord
  belongs_to :player
  belongs_to :game
  has_many :player_hand_cards
  has_many :cards, through: :player_hand_cards

  validates :bet, presence: true

  def deal_card
    PlayerHandCard.create(player_hand_id: self.id, card_id: self.game.draw_unique_card.id)
  end

  def pay_bank
    self.player.bank += :payout*:bet
  end

  def stand
    active = false
  end

  def card_values
    self.player_hand_cards.map do |hand_card|
      # card_to_number is a player_hand_card method (same for dealer_hand_card)
      hand_card.card_to_number
    end
  end

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

  def outcome
    dealer_hand = self.game.dealer_hand
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

  # def convert_to_num
  #   new_array = []
  #   self.each{|card| 
  #     card.to_i != 0 ? new_array << card.to_i 
  #     : card == "A" ? new_array << "A" 
  #     : new_array << 10 
  #   }
  #   new_array
  # end

  # def a_to_number(array)
  #   none_a = array.select{|card| card != "A"}
  #   a_array = array.select{|card| card == "A"}
  #   if !a_array.empty?
  #     if a_array.length > 1
  #       if none_a.sum >= 10
  #         array = array.collect{|card| card.class == String ? card = 1 : card}
  #       else
  #         array = none_a.concat(more_a(a_array))
  #       end
  #     else
  #       none_a.sum > 10 ? array = none_a << 1 : array = none_a << 11
  #     end
  #   end
  #   array
  # end

  # def more_a(array)
  #   array.shift
  #   array.collect{|n| n = 1} << 11
  # end

  # def hands(array)
  #   a_to_number(convert_to_num(array))
  # end

end
