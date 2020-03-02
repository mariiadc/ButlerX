class Booking < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
  validates :check_in, presence: true, allow_blank: false
  validates :check_out, presence: true, allow_blank: false
  validates :booking_number, presence: true, allow_blank: false

end
