class Player < ApplicationRecord
    has_secure_password
    has_many :player_hands
    has_many :games, through: :player_hands
    has_many :player_hand_cards, through: :player_hands

    validates :username, presence: true, uniqueness: true
    validates :age, presence: true, numericality: { only_integer: true , greater_than: 18}
    validates :security_answer, presence: true 

    def games
        Game.all.reverse().select{|game| game.player_hands.pluck(:player_id).include?(self.id)}
    end

    def cards 
        card_ids = []
        games.each do |game| 
            player_hands = game.players.find(self.id).player_hands.where(game_id: game.id) 
            dealer_hands = game.dealer.dealer_hands.where(game_id: game.id)
            card_ids << { player: find_player_card_ids(player_hands), dealer: find_dealer_card_ids(dealer_hands), bet: game.min_bet}
        end
        card_ids
    end

    def find_player_card_ids(hand)
        hand[0].player_hand_cards.pluck(:card_id)
    end

    def find_dealer_card_ids(hand)
        hand[0].dealer_hand_cards.pluck(:card_id)
    end

    def win_lose(player, dealer)
        player_cards = Card.find(player).pluck(:value)
        dealer_cards = Card.find(dealer).pluck(:value)

        
    end

    def find_card(ids)
        c = Card.find(ids)
        string = ""
        c.each{|card| string += " #{card.value} #{card.suit}"}
        string
    end

    def find_value(ids)
        Card.find(ids).pluck(:value)
    end

    def player_card_value(player_cards)
        hands(find_value(player_cards))
    end

    def dealer_cards_value(dealer_cards)
        hands(find_value(dealer_cards))
    end 

    def win_lose(player,dealer)
        player = player_card_value(player)
        dealer = dealer_cards_value(dealer)
        if player.sum <= 21 && dealer.sum <= 21
          if black_jack(player) 
            "Black Jack"
          elsif black_jack(player) && black_jack(dealer) 
            "dealer win with Black Jack"
          elsif black_jack(dealer)
            "dealer win with Black Jack"
          elsif player.sum > dealer.sum 
            "player win"
          else
            "player lose"
          end 
        else
          "dealer win"
        end
    end
      
    def black_jack(array)
        return array.length == 2 && array.index(10) && array.index(11) ? true : false 
    end

    def amount_won?(your_bet, status)
        return status == "Black Jack" ? "+ #{your_bet * 1.5}" : status == "player win" ? "+ #{your_bet}" : "- #{your_bet}"
    end

end
