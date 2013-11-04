$:.unshift File.dirname(__FILE__)
$:.unshift './lib'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

task :default => :spec

desc "Ejecutamos las espectativas de rspec"
task :spec do
	sh "rspec -I. spec/matrix_spec.rb --format documentation"
end
