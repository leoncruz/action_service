# frozen_string_literal: true

RSpec.describe ActionService::Faliure do
  describe '#faliure?' do
    let(:instance) { described_class.new({}) }

    it { expect(instance.faliure?).to be true }
  end

  describe '#finish_on' do
    let(:instance) { described_class.new({}, faliure_on: 'create_user') }

    it 'has to return faliure_on informed on constructor' do
      expect(instance.finish_on).to eq 'create_user'
    end
  end
end
