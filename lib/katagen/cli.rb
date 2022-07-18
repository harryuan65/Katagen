require "thor"
require_relative "command"
module Katagen
  # Command CLI
  # :reek:UtilityFunction
  class CLI < Thor
    desc "leetcode <leetcode_question_id> <lang>", "create a folder to record your answer for the leet code question"
    long_desc <<~DESC
      <leetcode_question_id>: leetcode question id, ex: 1 \n
      <lang>: [optional] solution file extension, defaults to "rb" (ruby)
    DESC
    def leetcode(input_id, lang = "rb")
      Katagen::Command.leetcode(input_id, lang)
    end
  end
end
