require 'rails_helper'

RSpec.describe Campaign, type: :model do
  let(:start_date) { nil }
  let(:end_date) { nil }
  let(:params) { { start_date: start_date, end_date: end_date } }
  subject { Campaign.create(params) }

  describe 'star_date and end_date' do
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
end
