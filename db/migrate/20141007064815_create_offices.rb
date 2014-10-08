class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :location
      t.integer :employ_id

      t.timestamps
    end
  end
end
