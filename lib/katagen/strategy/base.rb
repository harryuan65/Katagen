module Katagen
  module Strategy
    #
    # @abstract Interface for question
    #
    class Base
      # @return [QuestionInfo] path for directory
      def build_question_info = raise(NotImplementedError)
    end
  end
end
