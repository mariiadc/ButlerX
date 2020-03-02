class Room < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
  validates :name, presence: true, allow_blank: false
  validates :availability, inclusion: { in: [true, false] }
  validates :number, numericality: true, allow_blank: false
  # INCLUDE THE KEY IN THE FUTURE!!!
end
