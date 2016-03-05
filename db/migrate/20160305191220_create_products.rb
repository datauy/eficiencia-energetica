class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :brand
      t.string :model
      t.string :description
      t.float :kwatts_hour
      t.string :efficiency_class
      t.integer :litres

      t.timestamps null: false
    end
  end
end
