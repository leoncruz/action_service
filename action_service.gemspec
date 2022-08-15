# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'action_service/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'action_service'
  spec.version     = ActionService::VERSION
  spec.authors     = ['Leon Cruz']
  spec.email       = ['leon.cruz.teixeira@gmail.com']
  spec.summary     = 'Simple gem to create ServiceObjects'
  spec.description = 'Simple gem to create ServiceObjects.'
  spec.license     = 'MIT'
  spec.required_ruby_version = '~> 2.7.6'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
          'public gem pushes.'
  end

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '~> 5.2.8', '>= 5.2.8.1'

  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-rails'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'rubycritic'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'sqlite3'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
