require_relative "../question_info"

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

      def build_question_info
        id = @input.to_i
        raise InvalidIndex.new(id) unless id.positive?

        summary = questions_summary.find{ |q| q["id"] == id }
        raise QuestionNotExist.new(@input) unless summary
        topic, difficulty = summary.values_at("topic", "difficulty")

        QuestionInfo.new(
          "#{difficulty}/#{id}.#{topic}",
          "https:/leetcode.com/problems/#{topic}"
        )
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
