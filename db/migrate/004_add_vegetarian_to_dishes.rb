class AddVegetarianToDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :vegetarian, :boolean
  end
end
