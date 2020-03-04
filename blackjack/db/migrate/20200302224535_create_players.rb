class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.integer :age
      t.integer :bank
    end
  end
end
