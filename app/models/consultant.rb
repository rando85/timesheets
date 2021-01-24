class Consultant < ApplicationRecord
  enum is_active: { inactive: 0, active: 1 }

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :team
  has_many :daily_hours
  has_many :vacations
end
