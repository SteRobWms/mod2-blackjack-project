class AddHandValueToPlayerHand < ActiveRecord::Migration[6.0]
  def change
    add_column :player_hands, :blackjack?, :boolean, default: false
  end
end
