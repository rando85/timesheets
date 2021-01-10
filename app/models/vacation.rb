class Vacation < ApplicationRecord
  belongs_to :day
  belongs_to :consultant
  belongs_to :reason
end
