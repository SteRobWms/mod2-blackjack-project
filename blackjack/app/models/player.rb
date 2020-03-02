class Player < ApplicationRecord
    has_many :player_hands
    has_many :games, through: :player_hands
    has_many :player_hand_cards, through: :player_hands
end
