class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.string :sku
      t.monetize :price, currency: { present: false }

      t.timestamps
    end
  end
end
