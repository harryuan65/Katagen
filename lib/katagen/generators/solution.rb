# frozen_string_literal: true

require "json"
require "erb"
require_relative "utils"

module Katagen
  module Generators
    # Generates a solution package
    class Solution
      include Utils
      #
      # Initialize generator with chosen method.
      #
      # @param [#build_kata_dirname] strategy: instance of FromId or FromUrl
      # @param [String] lang_ext: chosen solution file extension, defaults to `rb`(ruby)
      #
      def initialize(strategy, lang_ext)
        @strategy = strategy
        @lang_ext = lang_ext
      end

      def perform
        create_question_package(@strategy.build_kata_dirname)
      end

      private

      def create_question_package(kata_root)
        solution_path = File.join(kata_root, "solution.#{@lang_ext}")
        solution_spec_path = File.join(kata_root, "solution_spec.#{@lang_ext}")

        generate_folder(kata_root)
        generate_file(solution_path, dup_when_exists: true)
        generate_file(solution_spec_path) do |file|
          template_path = File.join(File.dirname(__FILE__), "../templates/solution_spec.#{@lang_ext}.erb")
          if File.exist?(template_path)
            template = File.read(template_path)
            result = ERB.new(template).result(binding)
            file.write(result)
          end
        end
      end
    end
  end
end
