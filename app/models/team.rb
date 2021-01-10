class Team < ApplicationRecord
  extend FriendlyId
  friendly_id :team, use: :slugged
end
