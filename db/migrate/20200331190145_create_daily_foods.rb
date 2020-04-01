class CreateDailyFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_foods do |t|
      t.date :date
      t.references :food, foreign_key: true

      t.timestamps
    end
    add_index :daily_foods, [:food_id, :date], :unique => true
  end
end
