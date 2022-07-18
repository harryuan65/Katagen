module Katagen
  module Strategy
    # :reek:U
    class InvalidIndex < StandardError
      def initialize(input) = super("#{input} is not a valid index")
    end

    # :reek:U
    class QuestionNotExist < StandardError
      def initialize(input) = super("question #{input} does not exist")
    end

    #
    # Generator for leetcode questions
    #
    class LeetCode
      def initialize(input)
        @input = input
      end

      def build_kata_dirname
        id = @input.to_i
        raise InvalidIndex.new(id) unless id.positive?

        summary = questions_summary[id - 1]
        raise QuestionNotExist.new(@input) unless summary

        "#{summary["difficulty"]}/#{id}.#{summary["topic"]}"
      end

      private

      #
      # @return [Array<Hash{String=>String}>] array of question summary
      #
      def questions_summary
        @summary ||= begin
          path = File.join(File.dirname(__FILE__), "../data/leetcode.json")
          raw_summary_text = File.read(path)
          JSON.parse(raw_summary_text)
        end
      end
    end
  end
end
