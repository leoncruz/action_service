# frozen_string_literal: true

RSpec.describe ActionService::Base do
  describe '.new' do
    context 'when parameter is not a hash' do
      it 'has to raise an ArgumentError' do
        expect do
          described_class.new Class.new
        end.to raise_error(ArgumentError)
      end
    end

    context 'when parameter is a empty hash' do
      it 'does not assign to attributes reader accessor' do
        instance = described_class.new { {} }

        expect(instance.attributes).to be_nil
      end

      it 'does not call create_attributes_for_instance method' do
        instance = described_class.new { {} }
        allow(instance).to receive(:create_attributes_for_instance)

        expect(instance).not_to have_received(:create_attributes_for_instance)
      end
    end

    context 'when parameter is not a empty hash' do
      it 'has to raise ArgumentError if hash keys are not in attr of class' do
        expect do
          described_class.new name: 'Test name'
        end.to raise_error(ArgumentError)
      end

      it 'has to assign to attr accessor if hash keys are in attr of class' do
        described_class.class_eval { attr_accessor :name }

        instance = described_class.new name: 'Test Name'

        expect(instance.name).to eq 'Test Name'
      end

      it 'has to assign to attributes reader if hash keys are in attr of class' do
        described_class.class_eval { attr_accessor :name }

        instance = described_class.new name: 'Test Name'

        expect(instance.attributes).to eq({ name: 'Test Name' })
      end
    end
  end

  describe '#call' do
    before do
      described_class.class_eval do
        attr_accessor :name

        actions :camelize_name

        def camelize_name
          self.name = name.split.map(&:camelize).join(' ')
        end
      end
    end

    it 'has to call actions informed on class' do
      instance = described_class.new name: 'test name'

      instance.call

      expect(instance.name).to eq 'Test Name'
    end
  end
end
