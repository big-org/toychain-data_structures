require 'minitest/autorun'
require 'minitest/reporters'
lib = File.expand_path('../../lib/toychain-data_structures/', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new({detailed_skip: false})
