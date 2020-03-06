class Player < ApplicationRecord
    has_secure_password
    has_many :player_hands
    has_many :games, through: :player_hands
    has_many :player_hand_cards, through: :player_hands

    validates :username, presence: true, uniqueness: true
    validates :age, presence: true, numericality: { only_integer: true , greater_than: 18}
    validates :security_answer, presence: true 
end
