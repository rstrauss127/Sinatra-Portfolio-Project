class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :type
      t.string :link
      t.text :description
      t.string :location
    end
  end
end
