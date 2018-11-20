class CreateGuests < ActiveRecord::Migration[4.2]
  def change
    create_table :guests do |t|
      t.string :name
      t.integer :amount
      t.integer :length_of_stay
    end
  end
end
