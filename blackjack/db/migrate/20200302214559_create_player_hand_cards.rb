class CreatePlayerHandCards < ActiveRecord::Migration[6.0]
  def change
    create_table :player_hand_cards do |t|
      t.belongs_to :player_hand, null: false, foreign_key: true
      t.belongs_to :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
