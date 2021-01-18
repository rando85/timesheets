class Day < ApplicationRecord
  enum is_weekend: { no: 0, yes: 1 }

  belongs_to :week
  belongs_to :month
end
