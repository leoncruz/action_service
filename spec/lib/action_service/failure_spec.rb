# frozen_string_literal: true

RSpec.describe ActionService::Failure do
  describe '#failure?' do
    let(:instance) { described_class.new({}) }

    it { expect(instance.failure?).to be true }
  end

  describe '#finish_on' do
    let(:instance) { described_class.new({}, failure_on: 'create_user') }

    it 'has to return failure_on informed on constructor' do
      expect(instance.finish_on).to eq 'create_user'
    end
  end
end
