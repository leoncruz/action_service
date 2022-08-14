# frozen_string_literal: true

require 'action_service/attributes'

module ActionService
  # Result class for execution
  class Result
    include Attributes

    attr_accessor :faliure_on, :finish_on

    def initialize(result_hash, faliure_on: nil, finish_on: nil)
      @faliure_on = faliure_on
      @finish_on = finish_on

      define_attr_reader_for_paramters result_hash
    end

    def faliure?
      raise NotImplementedError
    end

    def success?
      raise NotImplementedError
    end

    private

    def define_attr_reader_for_paramters(result_hash)
      define_attr_reader_for_class result_hash
    end
  end
end
