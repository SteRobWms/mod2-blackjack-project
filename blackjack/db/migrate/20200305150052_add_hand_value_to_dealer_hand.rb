class AddHandValueToDealerHand < ActiveRecord::Migration[6.0]
  def change
    add_column :dealer_hands, :hand_value, :string
  end
end
