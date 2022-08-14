# frozen_string_literal: true

require 'action_service/result'

module ActionService
  # Faliure object of actions
  class Faliure < Result
    def faliure?
      true
    end

    def finish_on
      faliure_on
    end
  end
end
