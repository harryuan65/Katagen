require "fileutils"
module Katagen
  module Generators
    # Common path utilities :reek:UtilityFunction
    module Utils
      # Generate a file ifne with custom body
      def generate_file(path, options = {}, &block)
        if !File.exist?(path)
        elsif options[:dup_when_exists]
          _, folder, target_file, ext = path.match(/(.+)\/(.+)\.(.+)\Z/).to_a
          count = Dir["#{folder}/*"].count { |file| file.match(/#{target_file}\d*\.#{ext}/) }
          path = "#{folder}/#{target_file}#{count + 1}.#{ext}"
        else
          puts "[Warning] File already exists: #{path}, skipping..."
          return nil
        end

        block ||= ->(file) {} unless block_given?
        File.open(path, "w", &block)
        puts "[Success] Created file #{path}"
      end

      # Mkdir ifne
      def generate_folder(dir_path)
        if File.directory?(dir_path)
          puts "[Warning] Dir already exists: #{dir_path}, skipping..."
        else
          FileUtils.mkdir_p(dir_path)
          puts "[Success] Created dir #{dir_path}"
        end
      end
    end
  end
end
