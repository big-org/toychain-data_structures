task :default => :test
task :unit_test do
  Dir.glob('./test/*_test.rb').each { |file| require file}
end