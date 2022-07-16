module Katagen
  class InvalidLeetCodeUrl < StandardError
    def initialize = super("invalid LeetCode question url")
  end

  class QuestionNotExist < StandardError
    def initialize(topic) = super("question \"#{topic}\" does not exist")
  end
end
