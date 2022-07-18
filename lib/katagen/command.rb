# frozen_string_literal: true

require_relative "generators/solution"
require_relative "strategy/leetcode"

module Katagen
  #
  # Entry generator from cli
  #
  class Command
    def self.leetcode(input_id, lang = "rb")
      strategy = Strategy::LeetCode.new(input_id)
      solution = Generators::Solution.new(strategy, lang)
      solution.perform
    end
  end
end
