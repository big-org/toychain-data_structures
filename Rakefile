require_relative './lib/toychain-data_structures/version.rb'
test_files = Dir.glob('./test/*_test.rb')

gem_name = 'toychain-data_structures'
gem_version = ToyChain::DataStructures::VERSION

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

desc "Reinstall Gem"
task :reinstall do
  system "gem uninstall #{gem_name}"

  begin
    FileUtils.remove_file "#{gem_name}-#{gem_version}.gem"
  rescue
  end

  system "gem build #{gem_name}.gemspec"
  system "gem install #{gem_name}-#{gem_version}.gem"
end

desc "Install Gem"
task :install => :reinstall
