# frozen_string_literal: true

require 'action_service/result'

module ActionService
  # Failure object of actions
  class Failure < Result
    def failure?
      true
    end

    def finish_on
      failure_on
    end
  end
end
