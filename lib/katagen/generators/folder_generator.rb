# frozen_string_literal: true

require "fileutils"

module Katagen
  # Mkdir ifne
  class FolderGenerator
    def self.perform(dir_path)
      if File.directory?(dir_path)
        puts "[Warning] Dir already exists: #{dir_path}, skipping..."
      else
        puts "[Info] Creating dir #{dir_path}"
        FileUtils.mkdir_p(dir_path)
        puts "[Success] Created dir #{dir_path}"
      end
    end
  end
end
