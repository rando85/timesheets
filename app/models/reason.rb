class Reason < ApplicationRecord
  extend FriendlyId
  friendly_id :reason, use: :slugged
end
