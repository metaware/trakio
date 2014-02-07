require "bundler/gem_tasks"

task default: [:test]

task :test do
  system 'bundle exec rspec spec'
end

task :console do
  require 'irb'
  require 'irb/completion'
  require 'trakio'
  ARGV.clear
  IRB.start
end