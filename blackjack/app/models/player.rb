class Player < ApplicationRecord
    has_many :player_hands
    has_many :games, through: :player_hands
    has_many :player_hand_cards, through: :player_hands

    def games
        Game.all.reverse().select{|game| game.player_hands.pluck(:player_id).include?(self.id)}
    end

    def cards 
        card_ids = []
        games.each do |game| 
            player_hands = game.players.find(self.id).player_hands.where(game_id: game.id) 
            dealer_hands = game.dealer.dealer_hands.where(game_id: game.id)
            card_ids << { player: find_player_card_ids(player_hands), dealer: find_dealer_card_ids(dealer_hands)}
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
end
