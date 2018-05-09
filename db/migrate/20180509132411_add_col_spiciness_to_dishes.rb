class AddColSpicinessToDishes < ActiveRecord::Migration[5.2]
  def change
    add_column :dishes, :spiciness, :integer
  end
end
