class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.string :title
      t.text :info_content
      t.boolean :is_valid, default:true, null: false

      t.timestamps
    end
  end
end
