require_relative './test_helper.rb'
require_relative '../lib/block/header.rb'

module ToyChain
  class TestHeader < Minitest::Test
    STANDARD_ACCESSORS = [
      :version,
      :time_stamp,
      :previous_hash,
      :difficulty
    ]

    def setup
      @nonce = 'NONCE'

      @header = Header.new(
        version: 'v0.0.1-test_version',
        time_stamp: '2016-07-22 15:42:10 UTC',
        previous_hash: 'PREVIOUS HASH',
        difficulty: 12
      )
    end

    def test_standard_accessors
      STANDARD_ACCESSORS.each do |accessor|
        assert @header.respond_to?(accessor)
      end
    end

    def test_for_set_nonce
      @header.set_nonce(@nonce)
      assert_equal @nonce, @header.nonce
    end
  end
end
