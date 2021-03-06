class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name
      t.integer :genre_id
      t.text :content
      t.string :image
      t.string :user_id
      t.integer :total_distance
      t.boolean :is_valid

      t.timestamps
    end
  end
end
