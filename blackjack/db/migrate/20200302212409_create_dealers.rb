class CreateDealers < ActiveRecord::Migration[6.0]
  def change
    create_table :dealers do |t|
      t.string :name
      t.integer :age
      t.integer :years_experience
      t.string :casino

      t.timestamps
    end
  end
end
