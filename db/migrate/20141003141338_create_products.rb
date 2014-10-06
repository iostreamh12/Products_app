class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :clave
      t.string :descripcion
      t.string :tipoventa
      t.float :preciocompra
      t.float :precioventa

      t.timestamps
    end
  end
end
