class CampaignsController < ApplicationController
  def campaign_data
    @campaigns = CampaignData.fetch(
      params[:start_date],
      params[:end_date],
      params[:hidden_campaign_classes] || []
    )
  end

  private

  # TODO dunno why this does not allow hidden_campaign_classes to go through
  def campaign_data_params
    params.permit(:start_date, :end_date, :hidden_campaign_classes)
  end
end
