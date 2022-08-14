# frozen_string_literal: true

RSpec.describe ActionService::Result do
  let(:instance) { described_class.new({ name: 'test', email: 'test@email.com' }) }

  describe '.new' do
    it 'has to create attr_reader for name key with value' do
      expect(instance.name).to eq 'test'
    end

    it 'has to create attr_reader for age key with value' do
      expect(instance.email).to eq 'test@email.com'
    end
  end

  describe '#faliure?' do
    it { expect { instance.faliure? }.to raise_error(NotImplementedError) }
  end

  describe '#success?' do
    it { expect { instance.success? }.to raise_error(NotImplementedError) }
  end
end
