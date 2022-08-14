# frozen_string_literal: true

RSpec.describe ActionService::Attributes do
  let(:dummy_class) { Class.new { include ActionService::Attributes } }
  let(:instance) { dummy_class.new }

  describe '#create_attributes_for_instance' do
    context 'when new_attributes are in attr of class' do
      before do
        dummy_class.class_eval { attr_accessor :name, :age }

        instance.create_attributes_for_instance(
          name: 'test name',
          age: 18
        )
      end

      it 'has to assign name value name accessor' do
        expect(instance.name).to eq 'test name'
      end

      it 'has to assign age value to accessor' do
        expect(instance.age).to eq 18
      end
    end

    context 'when new_attributes are not in attr of class' do
      before do
        dummy_class.class_eval { attr_accessor :name }
      end

      it 'has to raise an ArgumentError' do
        expect do
          instance.create_attributes_for_instance name: 'test name', age: 18
        end.to raise_error(ArgumentError)
      end
    end
  end

  describe '#define_attr_reader_for_class' do
    context 'when attributes are not a Hash' do
      it 'has to raise a TypeError' do
        expect do
          instance.define_attr_reader_for_class Object.new
        end.to raise_error(TypeError)
      end
    end

    context 'when attributes are hash' do
      before do
        instance.define_attr_reader_for_class name: 'teste', age: 18
      end

      it 'has to create attr_reader for name key with value' do
        expect(instance.name).to eq 'teste'
      end

      it 'has to create attr_reader for age key with value' do
        expect(instance.age).to eq 18
      end
    end
  end
end
