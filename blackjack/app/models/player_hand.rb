class PlayerHand < ApplicationRecord
  belongs_to :player
  belongs_to :game
  has_many :player_hand_cards
  has_many :cards, through: :player_hand_cards

  validates :bet, presence: true

  def deal_card
    PlayerHandCard.create(player_hand_id: self.id, card_id: self.game.draw_unique_card.id)
  end


end
