#VACATIONS
class CreateUnitGuests < ActiveRecord::Migration[4.2]
  def change
    create_table :unit_guests do |t|
      t.integer :unit_id
      t.integer :guest_id
    end
  end
end
