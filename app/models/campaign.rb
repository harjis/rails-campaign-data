class Campaign < ApplicationRecord
  has_and_belongs_to_many :product_locations
  validates_date :end_date, on_or_after: :start_date

  scope :touches_time_range, -> (start_date, end_date) do
    where("start_date <= ? AND end_date >= ?", end_date, start_date)
  end
end
