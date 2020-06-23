class CreateAthleticEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :athletic_events do |t|
      t.string :name

      t.timestamps
    end
  end
end
