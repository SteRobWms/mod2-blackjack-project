class ApplicationRecord < ActiveRecord::Base
  # helper_method :hand_value

  self.abstract_class = true

  # def hand_value(hand)
  #   hand."#{hand.class}_card".map{|hand_card| hand_card.card.value
  # end
  def convert_to_num(array)
    new_array = []
    array.each{|card| 
      card.to_i != 0 ? new_array << card.to_i 
      : card == "A" ? new_array << "A" 
      : new_array << 10 
    }
    new_array
  end

  def a_to_number(array)
    none_a = array.select{|card| card != "A"}
    a_array = array.select{|card| card == "A"}
    if !a_array.empty?
      if a_array.length > 1
        if none_a.sum >= 10
          array = array.collect{|card| card.class == String ? card = 1 : card}
        elsif none_a.sum <= 9
          array = none_a.concat(more_a(a_array))
        end
      else
        none_a.sum > 10 ? array = none_a << 1 : array = none_a << 11
      end
    end
    array
  end

  def more_a(array)
    array.shift
    array.collect{|n| n = 1} << 11
  end

  def hands(array)
    a_to_number(convert_to_num(array))
  end

end
