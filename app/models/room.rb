class Room < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
  has_many :roomservices
  validates :name, presence: true, allow_blank: false
  validates :availability, inclusion: { in: [true, false] }
  validates :room_number, numericality: true, allow_blank: false
  # INCLUDE THE KEY IN THE FUTURE!!!
end
