class Chat < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :hotel, class_name: "User"

  enum status: [ :active, :pending, :archived ]
end
