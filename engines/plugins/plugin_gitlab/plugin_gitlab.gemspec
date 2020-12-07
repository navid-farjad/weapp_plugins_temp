$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "plugin_gitlab/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name = 'plugin_gitlab'
  spec.version = PluginGitlab::VERSION
  spec.authors = ['Navid Farjad']
  spec.email = ['admin@weapp.io']
  spec.homepage = 'HTTPS://WEAPP.IO'
  spec.summary = 'plugin_gitlab features of WEAPP'
  spec.description = 'plugin_gitlab features of WEAPP'
  spec.license = 'Proprietary'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'active_interaction', '~> 3.7'
  spec.add_dependency 'rails', '~> 6.0.3', '>= 6.0.3.2'
  spec.add_dependency 'searchkick'
  spec.add_dependency 'kaminari'

  spec.add_development_dependency 'sqlite3'
end
