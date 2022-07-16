require "thor"

module Katagen
  class CLI < Thor
    desc "new LEETCODE_URL", "create a folder to record your answer for the leet code question"
    def new(url)
      puts "Hello #{url}"
    end
  end
end
