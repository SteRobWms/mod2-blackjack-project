class AddPayoutToPlayerHand < ActiveRecord::Migration[6.0]
  def change
    add_column :player_hands, :payout, :integer
  end
end
