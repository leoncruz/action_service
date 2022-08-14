# frozen_string_literal: true

require 'action_service/result'

module ActionService
  # Success object of actions
  class Success < Result
    def success?
      true
    end
  end
end
