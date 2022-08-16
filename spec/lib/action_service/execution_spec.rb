# frozen_string_literal: true

RSpec.describe ActionService::Execution do
  let(:dummy_class) do
    Class.new do
      include ActionService::Execution

      def create_user
        failure error: true
      end

      def send_email
        success success: true
      end
    end
  end
  let(:instance) { dummy_class.new }

  describe '#execute' do
    let(:instance) { dummy_class.new }

    before do
      allow(instance).to receive(:create_user).and_call_original
    end

    it 'has to execute list of informed actions' do
      instance.execute [:create_user]

      expect(instance).to have_received(:create_user)
    end

    context 'when action return a Failure instance' do
      it 'has to fill failure_on with action' do
        result = instance.execute [:create_user]

        expect(result.failure_on).to eq(:create_user)
      end

      it 'has to fill finish_on with action' do
        result = instance.execute [:create_user]

        expect(result.finish_on).to eq(:create_user)
      end
    end

    context 'when action return a Success instance' do
      it 'has to fill finish_on with action' do
        result = instance.execute [:send_email]

        expect(result.finish_on).to eq(:send_email)
      end
    end
  end

  describe '#failure' do
    it 'has to return a Failure instance' do
      expect(instance.failure({})).to be_instance_of ActionService::Failure
    end
  end

  describe '#success' do
    it 'has to return a Success instance' do
      expect(instance.success({})).to be_instance_of ActionService::Success
    end
  end
end
