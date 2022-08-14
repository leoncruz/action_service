# frozen_string_literal: true

require 'action_service/actions'
require 'action_service/attributes'
require 'action_service/execution'

module ActionService
  # Base class for services
  class Base
    extend Actions

    include Attributes
    include Execution

    attr_reader :attributes

    def initialize(new_attributes = {})
      unless new_attributes.is_a? Hash
        raise ArgumentError, "Pass a hash as an argument. #{new_attributes.class} passed."
      end

      return if new_attributes.empty?

      create_attributes_for_instance(new_attributes)

      @attributes = new_attributes
    end

    def call
      execute actions_to_execute
    end

    private

    def actions_to_execute
      self.class.methods_to_call
    end
  end
end
