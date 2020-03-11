class RemoveExtraFieldsFromCartItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :sku
    remove_column :cart_items, :price_cents
  end
end
