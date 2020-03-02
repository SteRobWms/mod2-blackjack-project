class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :min_bet
      t.integer :max_bet

      t.timestamps
    end
  end
end
