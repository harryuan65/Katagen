# frozen_string_literal: true

module Katagen
  # Generate a file ifne with custom body
  class FileGenerator
    def self.perform(path, options = {}, &block)
      if !File.exist?(path)
        puts "[Info] Creating file #{path}"
      elsif options[:dup_when_exists]
        _, folder, file, ext = path.match(/(.+)\/(.+)\.(.+)\Z/).to_a
        count = Dir["#{folder}/*"].count { |f| f.match(/#{file}\d*\.#{ext}/) }
        path = "#{folder}/#{file}#{count + 1}.#{ext}"
      else
        puts "[Warning] File already exists: #{path}, skipping..."
        return nil
      end

      block ||= ->(f) {} unless block_given?
      File.open(path, "w", &block)
      puts "[Success] Created file #{path}"
    end
  end
end
