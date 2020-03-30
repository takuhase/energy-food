class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :chinese_name
      t.string :english_name
      t.references :food_category, foreign_key: true

      t.timestamps
    end
  end
end
