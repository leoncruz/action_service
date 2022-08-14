# frozen_string_literal: true

module ActionService
  # Module for handle attribute assignment
  module Attributes
    def create_attributes_for_instance(new_attributes)
      new_attributes.each do |key, value|
        _assign_attribute(key, value)
      end
    end

    def define_attr_reader_for_class(attributes)
      _check_if_params_hash attributes

      attributes.each_key do |key|
        _create_attr_reader key

        _setup_attr_reader_value key, attributes[key]
      end
    end

    private

    def _check_if_params_hash(params)
      raise TypeError, "Pass a hash as an argument. #{params.class} passed." unless params.is_a? Hash
    end

    def _assign_attribute(key, value)
      setter = :"#{key}="

      raise ArgumentError, "Instance of #{self.class.name} does not respond to #{setter}" unless respond_to?(setter)

      public_send(setter, value)
    end

    def _create_attr_reader(key)
      self.class.class_eval { attr_reader key.to_sym }
    end

    def _setup_attr_reader_value(key, value)
      instance_variable_set :"@#{key}", value
    end
  end
end
