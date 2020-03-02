class CreatePlayerHandCards < ActiveRecord::Migration[6.0]
  def change
    create_table :player_hand_cards do |t|
      t.integer :player_hand_id
      t.integer :card_id

      t.timestamps
    end
  end
end
