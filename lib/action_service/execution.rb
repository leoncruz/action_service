# frozen_string_literal: true

require 'action_service/success'
require 'action_service/failure'

module ActionService
  # Module for execute actions from ActionService
  module Execution
    def execute(actions_to_execute) # rubocop:disable Metrices/MethodLength
      actions_to_execute.each do |action|
        result = send(action.to_sym)

        next if result.nil? || !result.is_a?(Result)

        case result
        when Failure
          result.failure_on = action
          result.finish_on = action
          break result
        when Success
          result.finish_on = action
        end

        return result
      end
    end

    def failure(hash)
      Failure.new hash
    end

    def success(hash)
      Success.new hash
    end
  end
end
