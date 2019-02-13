class Campaign < ApplicationRecord
  has_and_belongs_to_many :product_locations
  validates_date :end_date, on_or_after: :start_date

  enum campaign_class: [:promotion, :cannibalization]

  scope :touches_time_range, -> (start_date, end_date) do
    where("start_date <= ? AND end_date >= ?", end_date, start_date)
  end
  scope :visible, -> (hidden_campaign_classes) { where("campaign_class NOT IN (?)", hidden_campaign_classes) unless hidden_campaign_classes.empty? }
end
