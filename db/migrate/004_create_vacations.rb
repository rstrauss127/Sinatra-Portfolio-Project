class CreateVacations < ActiveRecord::Migration[4.2]
  def change
    create_table :vacations do |t|
      t.integer :guest_id
      t.integer :condo_id
    end
  end
end
