class Day < ApplicationRecord
  belongs_to :week
  belongs_to :month
end
