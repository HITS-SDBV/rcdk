require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

#https://github.com/mguymon/lock_jar/blob/master/README.md#gem-integration
task :jarfile_lock do
  require 'lock_jar'

  # get jarfile relative the gem dir
  lockfile = File.expand_path("../Jarfile.lock", __FILE__)

  LockJar.install(lockfile)
end

task :default => :jarfile_lock
