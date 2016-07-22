test_files = Dir.glob('./test/*_test.rb')

task :default => :test

desc "Test individual file or all files"
task :test, :file_name do |t, args|
  test_files
    .grep(/#{args[:file_name]}/)
    .each { |file| require file}
end

desc "Watch individual file or all files"
task :watch, :file_name do |t, args|
  require 'rerun'

  options = Rerun::Options.parse
  options[:clear] = true
  Rerun::Runner.keep_running("rake test[#{args[:file_name]}]", options)
end
