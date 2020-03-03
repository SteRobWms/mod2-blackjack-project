class ApplicationRecord < ActiveRecord::Base
  # helper_method :hand_value

  self.abstract_class = true

  # def hand_value(hand)
  #   hand."#{hand.class}_card".map{|hand_card| hand_card.card.value
  # end

  
end
