Rails.application.routes.draw do
  get 'campaigns/campaign_data', to: 'campaigns#campaign_data'
end
