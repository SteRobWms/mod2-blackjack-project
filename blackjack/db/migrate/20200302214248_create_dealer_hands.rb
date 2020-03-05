class CreateDealerHands < ActiveRecord::Migration[6.0]
  def change
    create_table :dealer_hands do |t|
      t.integer :dealer_id
      t.integer :game_id
      t.boolean :active, default: true 
      t.timestamps
    end
  end
end
