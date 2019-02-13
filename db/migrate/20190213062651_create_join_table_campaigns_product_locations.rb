class CreateJoinTableCampaignsProductLocations < ActiveRecord::Migration[5.2]
  def change
    create_join_table :campaigns, :product_locations do |t|
      t.index [:campaign_id, :product_location_id], name: 'campaign_id_pl_id'
      t.index [:product_location_id, :campaign_id], name: 'pl_id_campaign_id'
    end
  end
end
