require_relative './test_helper.rb'
require_relative '../lib/block.rb'

module ToyChain
  class TestBlock < Minitest::Test
    def setup
      @block = Block
      @blobs = [1, 'Hey']
      @rl = RecordList.new(blobs: @blobs)
      @difficulty = 2
      @version = '0.0.1'
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
          version: @version
        )
          .respond_to?(accessor)
      end
    end

    def test_block_accepts_few_arguments
      assert @block.new(
        record_list: @rl,
        previous_hash: nil,
        difficulty: @difficulty,
        version: @version
      )
    end
  end
end
