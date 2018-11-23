class CreateGuests < ActiveRecord::Migration[4.2]
  def change
    create_table :guests do |t|
      t.string :name
    end
  end
end
