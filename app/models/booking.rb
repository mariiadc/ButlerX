class Booking < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  belongs_to :guest, class_name: "User"
  belongs_to :hotel, class_name: "User"

  validates :check_in, presence: true, allow_blank: false
  validates :check_out, presence: true, allow_blank: false
  validates :booking_number, presence: true, allow_blank: false
  has_one :chat_room

end
