class AddCaloriesToDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :calories, :integer
  end
end
