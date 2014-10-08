class AddExpirationDateToProducts < ActiveRecord::Migration
  def change
    add_column :products, :expiration_date, :date
  end
end
