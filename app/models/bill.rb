class Bill < ApplicationRecord
  belongs_to :service
  monetize :amount_cents
end
