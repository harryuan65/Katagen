# frozen_string_literal: true

require "json"
require "erb"
require_relative "file_generator"
require_relative "folder_generator"

module Katagen
  # Generates a solution
  class SolutionGenerator
    class << self
      def perform!(question_url)
        topic = question_url[%r{https://leetcode.com/problems/(?<topic>[a-z0-9-]+)}, :topic]
        raise "Unprocessable url" unless topic

        summary = questions_summary[topic]
        id, difficulty = summary.values_at("id", "difficulty")

        kata_root = File.join(difficulty, "#{id}.#{topic}")
        solution_path = File.join(kata_root, "solution.rb")
        solution_spec_path = File.join(kata_root, "solution_spec.rb")

        FolderGenerator.perform!(kata_root)
        FileGenerator.perform!(solution_path)
        FileGenerator.perform!(solution_spec_path) do |f|
          @method = "#solution"
          template = File.read(relative_path("../templates/solution_spec.rb.erb"))
          result = ERB.new(template).result(binding)
          f.write(result)
        end
      end

      private

      def questions_summary
        @summary ||= begin
          raw_summary_text = File.read(relative_path("../data/question_summary.json"))
          JSON.parse(raw_summary_text)
        end
      end

      def relative_path(path)
        File.join(File.dirname(__FILE__), path)
      end
    end
  end
end
