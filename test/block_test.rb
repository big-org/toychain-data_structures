require_relative './test_helper.rb'
require_relative '../lib/block.rb'

module ToyChain
  class TestBlock < Minitest::Test
    def setup
      @block = Block
      @blobs = [1, 'Hey']
      @rl = RecordList.new(blobs: @blobs)
      @difficulty = 2
    end

    def test_block_has_required_accessors
      [
        :header,
        :record_list,
      ].each do |accessor|
        assert @block.new(
          record_list: @rl,
          previous_hash: nil,
          difficulty: @difficulty
        )
          .respond_to?(accessor)
      end
    end

    def test_block_accepts_record_list_and_difficulty
      assert @block.new(
        record_list: @rl,
        previous_hash: nil,
        difficulty: @difficulty
      )
    end
  end
end
