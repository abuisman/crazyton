# frozen_string_literal: true

require_relative "lib/crazyton/version"

Gem::Specification.new do |spec|
  spec.name = "crazyton"
  spec.version = Crazyton::VERSION
  spec.authors = ["Achilleas Buisman"]
  spec.email = ["accounts@abuisman.nl"]

  spec.summary = "Like Singleton, but without `instance`."
  spec.description = "Exposes instance methods as class methods using a Singleton under the hood."
  spec.homepage = "https://abuisman.nl"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["rubygems_mfa_required"] = "true"
  spec.metadata["source_code_uri"] = "https://github.com/abuisman/crazyton"
  spec.metadata["changelog_uri"] = "https://github.com/abuisman/crazyton/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
