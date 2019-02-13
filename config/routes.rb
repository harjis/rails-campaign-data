Rails.application.routes.draw do
  get 'campaigns/campaign_data', to: 'campaings#campaign_data'
end
