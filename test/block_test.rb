require_relative './test_helper.rb'
require_relative '../lib/block.rb'
require_relative '../lib/serializer.rb'
require_relative '../lib/block/header.rb'

module ToyChain
  class TestBlock < Minitest::Test
    def setup
      @h = Header
      @block = Block
      @blobs = [1, 'Hey']
      @rl = RecordList.new(blobs: @blobs)
      @difficulty = 2
      @version = '0.0.1'
      @time_stamp = '2016-07-29 19:09:45 +0530'
    end

    def test_block_has_required_accessors
      [
        :header,
        :record_list,
      ].each do |accessor|
        assert @block.new(
          record_list: @rl,
          previous_hash: nil,
          difficulty: @difficulty,
          version: @version,
          time_stamp: @time_stamp
        )
          .respond_to?(accessor)
      end
    end

    def test_block_accepts_few_arguments
      assert @block.new(
        record_list: @rl,
        previous_hash: nil,
        difficulty: @difficulty,
        version: @version,
        time_stamp: @time_stamp
      )
    end

    def test_header_is_being_initialized
      time_stamp = '2016-07-29 19:09:45 +0530'
      version = '0.0.1'
      p_hash = 'PREVIOUS_HASH'
      nonce = 'RANDOM_VALUE'
      difficulty = 2

      header = @h.new(
        version: version,
        time_stamp: time_stamp,
        previous_hash: p_hash,
        difficulty: difficulty
      )

      block = @block.new(
        record_list: [],
        previous_hash: p_hash,
        difficulty: difficulty,
        version: version,
        time_stamp: time_stamp
      )

      block.set_nonce(nonce)
      serial_header = Serializer.serialize(header)
      serial_b_header = Serializer.serialize(block.header)

      assert_equal(
        serial_header,
        serial_b_header
      )
    end
  end
end
