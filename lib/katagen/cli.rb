require "thor"
require_relative "command"
module Katagen
  # Command CLI
  class CLI < Thor
    desc "leetcode <leetcode_question_id> [options]", "create a folder to record your answer for the leet code question"
    method_option :cwd, default: "./", desc: "current working directory"
    method_option :lang, default: "rb", desc: "file extension for solution"
    def leetcode(input_id)
      Katagen::Command.leetcode(input_id, options)
    end
  end
end
