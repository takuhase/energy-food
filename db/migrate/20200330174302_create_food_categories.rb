class CreateFoodCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :food_categories do |t|
      t.string :name
      t.references :nutrient, foreign_key: true

      t.timestamps
    end
  end
end
