class Roomservice < ApplicationRecord
  belongs_to :service
  belongs_to :room
end
