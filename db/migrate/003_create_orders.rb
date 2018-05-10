class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :dish_id
      t.integer :customer_id
    end
  end
end
