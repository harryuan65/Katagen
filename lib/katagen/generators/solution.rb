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
      # @param [#build_kata_dirname] strategy: instance of FromId or FromUrl
      # @param [String] lang_ext: chosen solution file extension, defaults to `rb`(ruby)
      #
      def initialize(strategy, lang_ext)
        @strategy = strategy
        @lang_ext = lang_ext
      end

      def create_package
        kata_root = @strategy.build_kata_dirname
        generate_folder(kata_root)
        create_solution(kata_root)
        create_solution_spec(kata_root)
      end

      private

      def create_solution(kata_root)
        solution_path = File.join(kata_root, "solution.#{@lang_ext}")
        template_path = File.join(File.dirname(__FILE__), "../templates/solution.#{@lang_ext}.erb")

        @timestamp = Time.now.iso8601
        @title = kata_root

        if File.exist?(template_path)
          generate_file(solution_path, dup_when_exists: true) do |file|
            write_template(file, template_path)
          end
        end
      end

      def create_solution_spec(kata_root)
        solution_spec_path = File.join(kata_root, "solution_spec.#{@lang_ext}")
        template_path = File.join(File.dirname(__FILE__), "../templates/solution_spec.#{@lang_ext}.erb")

        if File.exist?(template_path)
          generate_file(solution_spec_path) do |file|
            write_template(file, template_path)
          end
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
