require "thor"
require_relative "generators/solution_generator"
module Katagen
  class CLI < Thor
    desc "new LEETCODE_URL", "create a folder to record your answer for the leet code question"
    def new(url)
      SolutionGenerator.perform!(url)
    end
  end
end
