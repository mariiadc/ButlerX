class Event < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
  validates :name, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  has_one_attached :photo

end
