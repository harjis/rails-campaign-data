module CampaignData
  def self.fetch(start_date, end_date)
    Campaign.touches_time_range(start_date, end_date).joins(:product_locations)
  end
end
