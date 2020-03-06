class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :username
      t.string :password_digest
      t.string :security_question
      t.string :security_answer
      t.string :name
      t.integer :age
      t.integer :bank, default: 2000
    end
  end
end
