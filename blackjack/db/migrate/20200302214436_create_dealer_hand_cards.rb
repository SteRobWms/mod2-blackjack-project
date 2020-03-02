class CreateDealerHandCards < ActiveRecord::Migration[6.0]
  def change
    create_table :dealer_hand_cards do |t|
      t.integer :dealer_hand_id
      t.integer :card_id

      t.timestamps
    end
  end
end
