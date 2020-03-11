class Cart < ApplicationRecord
  belongs_to :user
  has_many :items, class_name: 'CartItem', dependent: :destroy

  def empty!
    items.destroy_all
  end
end
