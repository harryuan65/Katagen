# frozen_string_literal: true

require_relative "generators/solution"
require_relative "strategy/leetcode"

module Katagen
  #
  # Entry generator from cli
  #
  class Command
    def self.leetcode(input_id, lang = "rb")
      solution = Generators::Solution.new(Strategy::LeetCode.new(input_id), lang)
      solution.create_package
    end
  end
end
