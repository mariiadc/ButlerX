class CartItem < ApplicationRecord
  belongs_to :cartable, polymorphic: true
  delegate :photo, :name, :price, :price_cents, :sku, to: :cartable
end
