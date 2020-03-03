class Game < ApplicationRecord
    has_many :player_hands
    has_many :players, through: :player_hands
    has_many :player_hand_cards, through: :player_hands
    has_one :dealer_hand
    has_one :dealer, through: :dealer_hand
    has_many :dealer_hand_cards, through: :dealer_hand

    def dealt_cards
        self.dealer_hand_cards + self.player_hand_cards
    end

    def draw_unique_card
        next_card = Card.all.sample
        until dealt_cards.pluck(:card_id).include?(next_card.id) == false
            next_card = Card.all.sample
        end
        next_card
    end
end
