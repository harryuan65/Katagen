# frozen_string_literal: true

require_relative "lib/katagen/version"

Gem::Specification.new do |spec|
  spec.name = "katagen"
  spec.version = Katagen::VERSION
  spec.authors = ["harryuan65"]
  spec.email = ["harryuan.65@gmail.com"]

  spec.summary = "Generates a folder for leet code practice"
  spec.description = "Generate a folder for a question to put all practice records for better reviewing"
  spec.homepage = "https://github.com/harryuan65/Katagen"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/harryuan65/Katagen"
  spec.metadata["changelog_uri"] = "https://github.com/harryuan65/Katagen/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "bin"
  spec.executables = ["katagen"]
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_runtime_dependency "thor", "~> 1.0"
  spec.add_runtime_dependency "erb", "~> 2.2.0"

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "reek", "~> 6.1"
  spec.add_development_dependency "standard", "~> 1.3"
  spec.add_development_dependency "rubocop", "~> 1.29"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
