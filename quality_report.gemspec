# frozen_string_literal: true

require_relative 'lib/quality_report/version'

Gem::Specification.new do |spec|
  spec.name    = 'quality_report'
  spec.version = QualityReport::VERSION
  spec.authors = ['Robb Shecter']
  spec.email   = ['robb@public.law']

  spec.summary     = 'Ruby code quality report for teams: generates comparative metrics.'
  spec.description = 'Ruby code quality report for teams: generates comparative metrics.'
  spec.homepage    = 'https://github.com/dogweather/ruby-quality-report'
  spec.license     = 'MPL-2.0'
  spec.required_ruby_version = '>= 3.1.0'

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri']   = "#{spec.homepage}/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rubocop',   '~> 1.68'
  spec.add_dependency "tty-table", "~> 0.12.0"


  spec.add_development_dependency 'rspec', '~> 3.2'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
