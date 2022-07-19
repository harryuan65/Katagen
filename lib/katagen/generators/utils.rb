require "fileutils"
require_relative "logging"

module Katagen
  module Generators
    # Common path utilities :reek:UtilityFunction
    module Utils
      include Generators::Logging
      # Generate a file ifne with custom body
      def generate_file(path, options = {}, &block)
        if !File.exist?(path)
        elsif options[:dup_when_exists]
          _, folder, target_file, ext = path.match(/(.+)\/(.+)\.(.+)\Z/).to_a
          count = Dir["#{folder}/*"].count { |file| file.match(/#{target_file}\d*\.#{ext}/) }
          path = "#{folder}/#{target_file}#{count + 1}.#{ext}"
        else
          warning "File already exists: #{path}, skipping..."
          return nil
        end

        block ||= ->(file) {} unless block_given?
        File.open(path, "w", &block)
        success "Created file #{path}"
      end

      # Mkdir ifne
      def generate_folder(dir_path)
        if File.directory?(dir_path)
          warning "Dir already exists: #{dir_path}, skipping..."
        else
          FileUtils.mkdir_p(dir_path)
          success "Created dir #{dir_path}"
        end
      end
    end
  end
end
