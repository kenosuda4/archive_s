class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.integer :user_id
      t.integer :competition_id
      t.integer :athletic_event_id
      t.string :name
      t.string :time

      t.timestamps
    end
  end
end
