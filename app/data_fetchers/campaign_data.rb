module CampaignData
  def self.fetch(start_date, end_date, hidden_campaign_classes = [])
    Campaign
      .visible(hidden_campaign_classes)
      .touches_time_range(start_date, end_date)
      .active
      .distinct
  end
end
