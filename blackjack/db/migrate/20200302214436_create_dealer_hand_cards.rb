class CreateDealerHandCards < ActiveRecord::Migration[6.0]
  def change
    create_table :dealer_hand_cards do |t|
      t.belongs_to :dealer_hand, null: false, foreign_key: true
      t.belongs_to :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
