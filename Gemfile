source 'https://rubygems.org'

# Specify your gem's dependencies in rcdk.gemspec
gemspec

#https://github.com/mguymon/lock_jar/blob/master/README.md#bundler-integration
@@check ||= at_exit do
  require 'lock_jar/bundler'
  LockJar::Bundler.lock!
end
