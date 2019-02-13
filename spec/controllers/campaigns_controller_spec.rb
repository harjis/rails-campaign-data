require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do
  render_views
  before :each do
    request.env["HTTP_ACCEPT"] = 'application/json'
  end

  describe 'campaign_data' do
    let(:start_date) { '2019-01-01' }
    let(:end_date) { '2019-01-01' }
    let(:hidden_campaign_classes) { [] }
    before :each do
      c1 = Campaign.new(
        name: 'C1',
        campaign_class: Campaign.campaign_classes[:promotion],
        start_date: '2019-01-01',
        end_date: '2019-01-01',
        product_locations: [
          ProductLocation.new(name: 'PL1')
        ]
      )
      c1.save
      c2 = Campaign.new(
        name: 'C1',
        campaign_class: Campaign.campaign_classes[:promotion],
        start_date: '2019-01-01',
        end_date: '2019-01-01'
      )
      c2.save


    end
    it 'responds with success' do
      params = {
        :start_date => start_date,
        :end_date => end_date,
        :hidden_campaign_classes => hidden_campaign_classes
      }
      get :campaign_data, params: params

      expect(response).to have_http_status(:success)
    end

    it 'has correct amount of campaigns' do
      params = {
        :start_date => start_date,
        :end_date => end_date,
        :hidden_campaign_classes => hidden_campaign_classes
      }
      get :campaign_data, params: params

      pp response.body
    end
  end
end
