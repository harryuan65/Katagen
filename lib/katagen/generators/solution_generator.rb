# frozen_string_literal: true

require "json"
require "erb"
require_relative "file_generator"
require_relative "folder_generator"
require_relative "exceptions"
module Katagen
  # Generates a solution
  class SolutionGenerator
    class << self
      def perform(input_url, lang_ext = "rb")
        topic = filter_topic(input_url)
        summary = fetch_summary(topic)
        kata_root = build_kata_root(summary, topic)
        create_question_package(kata_root, lang_ext)
      end

      private

      def filter_topic(input_url)
        topic = input_url[%r{https://leetcode.com/problems/(?<topic>[a-z0-9-]+)}, :topic]
        raise InvalidLeetCodeUrl unless topic

        topic
      end

      def fetch_summary(topic)
        summary = questions_summary[topic]
        raise QuestionNotExist.new(topic) unless summary

        summary
      end

      def build_kata_root(summary, topic)
        id, difficulty = summary.values_at("id", "difficulty")
        "#{difficulty}/#{id}.#{topic}"
      end

      def create_question_package(kata_root, lang_ext)
        solution_path = File.join(kata_root, "solution.#{lang_ext}")
        solution_spec_path = File.join(kata_root, "solution_spec.#{lang_ext}")

        FolderGenerator.perform(kata_root)
        FileGenerator.perform(solution_path, dup_when_exists: true)
        FileGenerator.perform(solution_spec_path) do |f|
          template_path = relative_path("../templates/solution_spec.#{lang_ext}.erb")
          if File.exist?(template_path)
            template = File.read(template_path)
            result = ERB.new(template).result(binding)
            f.write(result)
          end
        end
      end

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
