# frozen_string_literal: true

RSpec.describe ActionService::Actions do
  let(:dummy_class) do
    Class.new do
      extend ActionService::Actions

      def initialize(**args); end

      def call; end
    end
  end

  describe '.actions' do
    it 'has to assign params to methods_to_call accessor' do
      dummy_class.actions :update_lead, :save_user

      expect(dummy_class.methods_to_call).to match_array(%i[update_lead save_user])
    end
  end

  describe '.call' do
    let(:instance) { instance_double(dummy_class) }

    before do
      allow(dummy_class).to receive(:new).with(any_args).and_return(instance)
      allow(instance).to receive(:call)
    end

    it 'has to call instance method with informed args' do
      dummy_class.call name: 'test'

      expect(instance).to have_received(:call)
    end
  end
end
