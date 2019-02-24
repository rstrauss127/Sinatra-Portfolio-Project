class CreateStudySessions < ActiveRecord::Migration[5.2]
  def change
    create_table :study_sessions do |t|
      t.integer :length
      t.string :topic
      t.text :description
    end
  end
end
