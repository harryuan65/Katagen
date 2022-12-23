# frozen_string_literal: true

require "json"
require "erb"
require "time"
require_relative "utils"

module Katagen
  module Generators
    # Generates a solution package
    class Solution
      include Utils
      #
      # Initialize generator with chosen method.
      #
      # @param [#build_question_info] strategy: instance of FromId or FromUrl
      # @param [Hash] options: see cli.rb
      # @option options [String] cwd current working directory, defaults is "./"
      # @option options [String] lang_ext solution file extension, defaults to "rb" (ruby)
      def initialize(strategy, options)
        @strategy = strategy
        @lang_ext = options[:lang] || "rb"
        @cwd = options[:cwd] || "./"
      end

      #
      # Create the folder containing: solution.rb, solution_spec.rb (defaults to rb)
      #
      # @param [String] cwd: default to ./
      #
      def create_package
        question_info = @strategy.build_question_info
        root = File.expand_path(File.join(@cwd, question_info.root))
        generate_folder(root)
        create_solution(root, question_info.url)
        create_solution_spec(root)
      end

      private

      def create_solution(root, url)
        solution_path = File.join(root, "solution.#{@lang_ext}")
        template_path = File.join(File.dirname(__FILE__), "../templates/solution.#{@lang_ext}.erb")

        @timestamp = Time.now.iso8601
        @url = url

        generate_file(solution_path, dup_when_exists: true) do |file|
          write_template(file, template_path) if File.exist?(template_path)
        end
      end

      def create_solution_spec(root)
        solution_spec_path = File.join(root, "solution_spec.#{@lang_ext}")
        template_path = File.join(File.dirname(__FILE__), "../templates/solution_spec.#{@lang_ext}.erb")

        generate_file(solution_spec_path) do |file|
          write_template(file, template_path) if File.exist?(template_path)
        end
      end

      private

      def write_template(file, template_path)
        template = File.read(template_path)
        result = ERB.new(template).result(binding)
        file.write(result)
      end
    end
  end
end
