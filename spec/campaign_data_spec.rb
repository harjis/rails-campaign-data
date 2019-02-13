require 'rails_helper'

RSpec.describe CampaignData, type: :model do
  describe 'fetch' do
    let(:start_date) {}
    let(:end_date) {}
    let(:hidden_campaign_classes) { [] }
    subject { CampaignData.fetch(start_date, end_date, hidden_campaign_classes) }
    context 'when campaign touches viewing time range' do
      let(:start_date) { '2019-01-01' }
      let(:end_date) { '2019-01-01' }

      context 'when campaign is joined to product location' do
        it 'is returned' do
          c1 = Campaign.new(
            name: 'C1',
            campaign_class: 1,
            start_date: '2019-01-01',
            end_date: '2019-01-01',
            product_locations: [
              ProductLocation.new(name: 'PL1')
            ]
          )
          c1.save

          expect(subject.count).to eq 1
        end

        context 'when campaigns class is hidden' do
          let(:hidden_campaign_classes) { [1] }

          it 'is not returned' do
            c1 = Campaign.new(
              name: 'C1',
              campaign_class: 1,
              start_date: '2019-01-01',
              end_date: '2019-01-01',
              product_locations: [
                ProductLocation.new(name: 'PL1')
              ]
            )
            c1.save

            expect(subject.count).to eq 0
          end
        end
      end

      context 'when campaign is not joined to product location' do
        it 'is not returned' do
          c1 = Campaign.new(
            name: 'C1',
            campaign_class: 1,
            start_date: '2019-01-01',
            end_date: '2019-01-01',
          )
          c1.save

          expect(subject.count).to eq 0
        end
      end
    end

    context 'when campaign does not touch viewing time range' do
      let(:start_date) { '2019-02-01' }
      let(:end_date) { '2019-02-01' }

      context 'when campaign is not joined to product location' do
        it 'is not returned' do
          c1 = Campaign.new(
            name: 'C1',
            campaign_class: 1,
            start_date: '2019-01-01',
            end_date: '2019-01-01'
          )
          c1.save

          expect(subject.count).to eq 0
        end
      end

      context 'when campaign is joined to product location' do
        it 'is not returned' do
          c1 = Campaign.new(
            name: 'C1',
            campaign_class: 1,
            start_date: '2019-01-01',
            end_date: '2019-01-01',
            product_locations: [
              ProductLocation.new(name: 'PL1')
            ]
          )
          c1.save

          expect(subject.count).to eq 0
        end
      end
    end
  end
end
