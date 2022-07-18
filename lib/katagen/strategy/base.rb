module Katagen
  module Strategy
    #
    # @abstract Interface for question
    #
    class Base
      # @return [String] path for directory
      def build_kata_dirname = raise(NotImplementedError)
    end
  end
end
