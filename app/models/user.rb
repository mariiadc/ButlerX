class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings
  has_many :chats
  has_many :services
  has_many :rooms
  has_many :events
  has_many :meals, through: :services

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [ :guest, :hotel]

end
