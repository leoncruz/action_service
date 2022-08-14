# frozen_string_literal: true

RSpec.describe ActionService::Success do
  describe '#success?' do
    let(:instance) { described_class.new({}) }

    it { expect(instance.success?).to be true }
  end
end
