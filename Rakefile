require 'rspec/core/rake_task'
require File.expand_path('../lib/controller', __FILE__)

RSpec::Core::RakeTask.new(:spec)

task :default  => :spec

desc "Run the mars rover"
task :run do
  controller = Controller.new("5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM")
  puts "Received input:"
  puts "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"
  puts '------------------------------'
  puts 'final location of all rovers:'
  puts controller.mission_report
end
