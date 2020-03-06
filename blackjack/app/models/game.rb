class Game < ApplicationRecord
    has_many :player_hands
    has_many :players, through: :player_hands
    has_many :player_hand_cards, through: :player_hands
    has_one :dealer_hand
    has_one :dealer, through: :dealer_hand
    has_many :dealer_hand_cards, through: :dealer_hand

    # connects dealer_hand_cards array with player_hand_cards array to test newly-drawn cards against for uniqueness.
    def dealt_cards
        self.dealer_hand_cards + self.player_hand_cards
    end

    def draw_unique_card
        deck = Card.all - self.dealt_cards
        deck.shuffle.first
    end
end
