class CreateCompetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :competitions do |t|
      t.string :name
      t.integer :user_id
      t.integer :genre_id
      t.date :day
      t.text :summary
      t.boolean :is_valid

      t.timestamps
    end
  end
end
