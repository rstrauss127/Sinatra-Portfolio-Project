class CreateUnits < ActiveRecord::Migration[4.2]
  def change
    create_table :units do |t|
      t.string :name
    end
  end
end
