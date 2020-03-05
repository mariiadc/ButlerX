class ChannelMessage < ApplicationRecord
  belongs_to :user
  belongs_to :channel, inverse_of: :channel_messages
end
