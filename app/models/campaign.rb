class Campaign < ApplicationRecord
  validates_date :end_date, on_or_after: :start_date
end
