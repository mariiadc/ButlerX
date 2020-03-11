class Meal < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # belongs_to :service
  has_one_attached :photo
  validates :name, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :price_cents, numericality: true, allow_blank: false
  has_many :cart_items, as: :cartable
  monetize :price_cents
end
