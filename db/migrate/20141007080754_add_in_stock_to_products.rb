class AddInStockToProducts < ActiveRecord::Migration
  def change
    add_column :products, :instock, :boolean
  end
end
