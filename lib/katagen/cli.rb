require "thor"
require_relative "generators/solution_generator"
module Katagen
  class CLI < Thor
    desc "new <leetcode_url> <lang>", "create a folder to record your answer for the leet code question"
    long_desc <<~DESC
      <leetcode_url>: leetcode question url, ex: https://leetcode.com/problems/isomorphic-strings/ \n
      <lang>: [optional] solution file extension, defaults to "rb" (ruby)
    DESC
    def new(url, lang = "rb")
      SolutionGenerator.perform(url, lang)
    end
  end
end
