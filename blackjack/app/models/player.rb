class Player < ApplicationRecord
    has_secure_password
    has_many :player_hands
    has_many :games, through: :player_hands
    has_many :player_hand_cards, through: :player_hands

    validates :username, presence: true, uniqueness: true
    validates :age, presence: true, numericality: { only_integer: true , greater_than: 18}
    validates :security_answer, presence: true 

    # def games
    #   # find all the game belong to the player and reverse the order
    #     Game.all.reverse().select{|game| game.player_hands.pluck(:player_id).include?(self.id)}
    # end

    def cards 
      #.take(25) set limit to display
        card_ids = []
        self.games.reverse().take(25).each do |game| 
            player_hands = game.players.find(self.id).player_hands.where(game_id: game.id) 
            dealer_hands = game.dealer.dealer_hands.where(game_id: game.id)
            card_ids << { player: find_player_card_ids(player_hands), dealer: find_dealer_card_ids(dealer_hands), bet: game.min_bet}
        end
        card_ids # <== [{player: [all the card ids] , dealer: [all the dealer card ids], bet: bet}, {...}] this is all the game player has been play
    end

    def find_player_card_ids(hand) #player hand hand = [hand_object] hand[0] = hand_object 
        hand[0].player_hand_cards.pluck(:card_id)
    end

    def find_dealer_card_ids(hand)
        hand[0].dealer_hand_cards.pluck(:card_id)
    end

    def find_card(ids) # <== any card ids inside array 
        c = Card.find(ids) # <== find all card object by id and return back in the array
        string = ""
        c.each{|card| string += " #{card.value} #{card.suit}"} 
        string # <== return 2 diamonds (♦)
    end

    def find_value(ids)
      #passing array of any cards id to find a card value 
      Card.find(ids).pluck(:value)
    end

    def player_card_value(player_cards_id)
        # hands is in application models to calculate the value of player cards
        # need to passing a all card value and need inside array like ["K", "9"]
        hands(find_value(player_cards_id))
    end

    def dealer_cards_value(dealer_cards_id)
        hands(find_value(dealer_cards_id))
    end 

    def win_lose(player,dealer)
      #player = [card_id1,card_id2,...] all player hand card id 
      #dealer same as player
        player = player_card_value(player)
        dealer = dealer_cards_value(dealer)
        if player.sum <= 21 
          if black_jack(player) 
            "Black Jack"
          elsif black_jack(player) && black_jack(dealer) 
            "Push" 
          elsif black_jack(dealer)
            "dealer win with Black Jack"
          elsif player.sum > dealer.sum || dealer.sum > 21
            "player win"
          else
            "player lose"
          end 
        else
          "player lose"
        end
    end
      
    def black_jack(array) # <== card ids 
      #check for the black jack 
        return array.length == 2 && array.index(10) && array.index(11) ? true : false 
    end

    def amount_won?(your_bet, status) # status came form win_lose method
        return status == "Black Jack" ? "+ #{your_bet * 1.5}" : status == "player win" ? "+ #{your_bet}" : status == "Push" ? "0" : "- #{your_bet}"
    end

end
