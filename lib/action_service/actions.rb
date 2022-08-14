# frozen_string_literal: true

module ActionService
  # Actions is a module to define class methods to ActionService::Base instance
  module Actions
    attr_accessor :methods_to_call

    def actions(*args)
      @methods_to_call = args
    end

    def call(**args)
      new(**args).call
    end
  end
end
