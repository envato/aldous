module Aldous
  module ControllerService
    module ParamsConstructor
      attr_reader :params

      def initialize(params:)
        @params = params
      end
    end
  end
end