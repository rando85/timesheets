class Consultant < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  belongs_to :team
  has_many :daily_hours
end
