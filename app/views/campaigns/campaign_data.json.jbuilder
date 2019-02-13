Campaign.campaign_classes.each do |campaign_class|
  json.set! campaign_class[0], @campaigns.select { |campaign| campaign.campaign_class == campaign_class[0] }
end
