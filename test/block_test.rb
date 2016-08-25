require_relative './test_helper.rb'
require 'block.rb'
require 'serializer.rb'
require 'block/header.rb'

module ToyChain
  class TestBlock < Minitest::Test
    def setup
      time_stamp = '2016-07-29 19:09:45 +0530'
      version = '0.0.1'
      p_hash = 'PREVIOUS_HASH'
      @nonce = 'RANDOM_VALUE'
      @different_nonce = 'DIFFERENT_RANDOM_VALUE'
      difficulty = 2

      @h = Header
      @block = Block
      @blobs = [1, 'Hey']
      @rl = RecordList.new(blobs: @blobs)
      @difficulty = 2
      @version = '0.0.1'
      @time_stamp = '2016-07-29 19:09:45 +0530'

      @header1 = @h.new(
        version: version,
        time_stamp: time_stamp,
        previous_hash: p_hash,
        difficulty: difficulty
      )

      @header1.set_nonce(@nonce)

      @block1 = @block.new(
        record_list: [],
        previous_hash: p_hash,
        difficulty: difficulty,
        version: version,
        time_stamp: time_stamp
      )
      @block1.set_nonce(@nonce)

      @block2 = @block.new(
        record_list: [],
        previous_hash: p_hash,
        difficulty: difficulty,
        version: version,
        time_stamp: time_stamp
      )

      @block2.set_nonce(@nonce)

      @block3 = @block.new(
        record_list: [],
        previous_hash: p_hash,
        difficulty: difficulty,
        version: version,
        time_stamp: time_stamp
      )

      @block3.set_nonce(@different_nonce)
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
      serial_header = Serializer.serialize(@header1)
      serial_b_header = Serializer.serialize(@block1.header)

      assert_equal(
        serial_header,
        serial_b_header
      )
    end

    def test_set_nonce
      assert_equal @nonce, @block1.header.nonce
    end

    def test_hash_ids
      assert_equal @block2.hash_id, @block1.hash_id
      refute_equal @block3.hash_id, @block1.hash_id
    end
  end
end
