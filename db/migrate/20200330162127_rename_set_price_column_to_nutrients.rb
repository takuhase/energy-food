class RenameSetPriceColumnToNutrients < ActiveRecord::Migration[5.2]
  def change
    rename_column :nutrients, :set_price, :addon_price
  end
end
