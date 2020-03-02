class Service < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
  has_many :meals
  validates :name, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :category, presence: true, allow_blank: false
  validates :price, numericality: true, allow_blank: false

end
