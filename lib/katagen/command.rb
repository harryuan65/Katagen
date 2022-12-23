# frozen_string_literal: true

require_relative "generators/solution"
require_relative "strategy/leetcode"

module Katagen
  #
  # Entry generator from cli
  #
  class Command
    # @param [String] input_id: question id
    # @param [Hash] options
    # @option options [String] cwd: defaults to "./"
    def self.leetcode(input_id, options = {})
      solution = Generators::Solution.new(Strategy::LeetCode.new(input_id), options)
      solution.create_package
    end
  end
end
