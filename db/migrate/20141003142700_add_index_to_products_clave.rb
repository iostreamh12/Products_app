class AddIndexToProductsClave < ActiveRecord::Migration
  def change
    add_index :products, :clave, unique: true
  end
end
