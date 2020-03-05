class AddHandValueToDealerHand < ActiveRecord::Migration[6.0]
  def change
    add_column :dealer_hands, :blackjack?, :boolean, default: false
  end
end
