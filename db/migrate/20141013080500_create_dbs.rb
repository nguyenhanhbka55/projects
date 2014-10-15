class CreateDbs < ActiveRecord::Migration
  def change
    create_table :dbs do |t|

      t.timestamps
    end
  end
end
