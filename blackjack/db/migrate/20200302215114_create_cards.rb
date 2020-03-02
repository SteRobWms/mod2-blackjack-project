class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :suit
      t.string :value
      t.belongs_to :deck, null: false, foreign_key: true

      t.timestamps
    end
  end
end
