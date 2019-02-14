module CampaignData
  def self.fetch(start_date, end_date, hidden_campaign_classes = [])
    Campaign
      .visible(hidden_campaign_classes)
      .touches_time_range(start_date, end_date)
      .active
      .select('campaigns.start_date, campaigns.end_date, campaigns.campaign_class, group_concat(DISTINCT campaigns.name)')
      .group('campaigns.start_date, campaigns.end_date, campaigns.campaign_class')
      .to_a
  end
end
