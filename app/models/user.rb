class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :guest_bookings, class_name: 'Booking', foreign_key: "guest_id"
  has_many :hotel_bookings, class_name: 'Booking', foreign_key: "hotel_id"
  has_many :hotel_events, class_name: 'Event', foreign_key: "hotel_id"
  has_many :hotel_services, class_name: 'Service', foreign_key: "hotel_id"
  has_many :hotel_rooms, class_name: 'Room', foreign_key: "hotel_id"
  has_many :hotel_chats, class_name: 'Chat', foreign_key: "hotel_id"
  has_one_attached :photo
  has_many :meals, through: :services
  has_many :bills

  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable, omniauth_providers: [:facebook]

  enum role: [ :guest, :hotel ]

  has_many :messages, dependent: :destroy

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice("provider", "uid")
    user_params.merge! auth.info.slice("email", "first_name", "last_name")
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

end
