class WeeklyHour < ApplicationRecord
  belongs_to :day
  belongs_to :consultant
end
