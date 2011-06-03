require 'yard'
YARD::Rake::YardocTask.new do |t|
  t.files = ['app/**/*.rb', 'lib/**/*.rb']
  t.options = ['--private', '--protected']
end