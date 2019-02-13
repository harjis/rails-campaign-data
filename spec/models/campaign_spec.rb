require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe 'star_date and end_date' do
    let(:start_date) { nil }
    let(:end_date) { nil }
    let(:params) { { start_date: start_date, end_date: end_date } }
    subject { Campaign.create(params) }

    context 'without start date and end date' do
      it { is_expected.to be_invalid }
    end

    context 'with start date and without end date' do
      let(:start_date) { Date.today }
      it { is_expected.to be_invalid }
    end

    context 'without start date and with end date' do
      let(:end_date) { Date.today }
      it { is_expected.to be_invalid }
    end

    context 'with start date and end date' do
      context 'when start date is before end date' do
        let(:start_date) { Date.today }
        let(:end_date) { Date.today + 1.days }
        it { is_expected.to be_valid }
      end

      context 'when start date is after end date' do
        let(:start_date) { Date.today + 1.days }
        let(:end_date) { Date.today }
        it { is_expected.to be_invalid }
      end

      context 'when start date is equal to end date' do
        let(:start_date) { Date.today }
        let(:end_date) { Date.today }
        it { is_expected.to be_valid }
      end
    end
  end

  describe 'touches_time_range' do
    # Unit test this function properly
    it 'returns only campaigns which touches the time range' do
      Campaign.create(name: 'C1', campaign_class: 1, start_date: '2019-01-01', end_date: '2019-01-01')
      Campaign.create(name: 'C2', campaign_class: 1, start_date: '2019-02-01', end_date: '2019-02-01')
      campaigns = Campaign.touches_time_range('2019-01-01', '2019-01-01')
      expect(campaigns.count).to eq 1
    end
  end
end
