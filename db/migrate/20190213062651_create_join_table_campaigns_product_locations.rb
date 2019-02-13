class CreateJoinTableCampaignsProductLocations < ActiveRecord::Migration[5.2]
  def change
    create_join_table :campaigns, :product_locations do |t|
      t.index [:campaign_id, :product_location_id]
      t.index [:product_location_id, :campaign_id]
    end
  end
end
