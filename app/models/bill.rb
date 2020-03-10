class Bill < ApplicationRecord
  #belongs_to :service
  belongs_to :billable, polymorphic: true
  monetize :amount_cents
end
