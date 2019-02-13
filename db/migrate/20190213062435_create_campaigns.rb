class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.integer :campaign_class
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
