class AddSpicinessToDishes < ActiveRecord::Migration[5.0]
  def change
    add_column :dishes, :spiciness, :integer
  end
end
