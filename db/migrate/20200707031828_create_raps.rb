class CreateRaps < ActiveRecord::Migration[5.2]
  def change
    create_table :raps do |t|
      t.integer :user_id
      t.integer :record_id
      t.integer :distance
      t.float :rap_time
      

      t.timestamps
    end
  end
end
