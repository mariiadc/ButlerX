class Service < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :hotel, class_name: "User"
  has_many :rooms, through: :roomservices
  # has_many :meals
  has_one_attached :photo

  validates :name, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :category, presence: true, allow_blank: false

  monetize :price_cents
end
