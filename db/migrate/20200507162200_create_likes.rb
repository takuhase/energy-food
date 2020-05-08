class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :food_id

      t.timestamps

      t.index :user_id
      t.index :food_id
      t.index [:user_id, :food_id], unique: true
    end
  end
end
