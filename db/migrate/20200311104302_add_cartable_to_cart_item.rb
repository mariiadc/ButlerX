class AddCartableToCartItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :cart_items, :cartable, polymorphic: true
  end
end
