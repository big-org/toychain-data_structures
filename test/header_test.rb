require_relative './test_helper.rb'
require_relative '../lib/block/header.rb'

module ToyChain
  class TestHeader < Minitest::Test
    STANDARD_ACCESSORS = [
      :version,
      :time_stamp,
      :previous_hash,
      :nonce,
      :difficulty
    ]

    def setup
      @header = Header.new(
      version: 'v0.0.1-test_version',
      time_stamp: '2016-07-22 15:42:10 UTC',
      previous_hash: 'PREVIOUS HASH',
      nonce: 'RANDOM VALUE',
      difficulty: 12
      )
    end

    def test_standard_accessors
      STANDARD_ACCESSORS.each do |accessor|
        assert @header.respond_to?(accessor)
      end
    end
  end
end
