class DealerHand < ApplicationRecord
  belongs_to :dealer
  belongs_to :game
  has_many :dealer_hand_cards
  has_many :cards, through: :dealer_hand_cards

  def deal_card
    DealerHandCard.create(dealer_hand_id: self.id, card_id: self.game.draw_unique_card.id)
  end

end
