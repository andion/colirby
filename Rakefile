require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
	t.libs << "lib/colibri"
	t.test_files = FileList['test/lib/colirby/*test*.rb']
	t.verbose = true
end
