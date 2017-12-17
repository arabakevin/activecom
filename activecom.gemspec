$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'activecom/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'activecom'
  s.version     = Activecom::VERSION
  s.authors     = ['Guillaume Hain']
  s.email       = ['zedtux@zedroot.org']
  s.homepage    = 'https://github.com/Sento/activecom'
  s.summary     = 'Intercom.io alternative as a Rails engine'
  s.description = 'Intercom.io alternative as a Rails engine'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile',
                'README.md']

  s.add_dependency 'font-awesome-rails', '~> 4.7.0.2'
  s.add_dependency 'js_cookie_rails', '~> 2.1.4'
  s.add_dependency 'rails', '~> 5.1.4'

  # s.add_development_dependency 'pg', '~> 0.21.0'
  # s.add_development_dependency 'database_cleaner', '~> 1.6.2'
end
