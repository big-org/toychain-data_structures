require 'minitest/autorun'
require 'minitest/reporters'

$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "lib")

Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new({detailed_skip: false})
