require_relative './test_helper.rb'
require_relative '../lib/record_list.rb'
require_relative '../lib/record.rb'

class TestRecords < Minitest::Test
  def setup
    @rl = ToyChain::RecordList
    @blobs = [1, 'Nikhil', 'Rakesh']
  end

  def test_if_sorted_set
    assert @rl.ancestors.include?(Array)
  end

  def test_constructor_can_accept_blob
    list = @rl
      .new(blobs: @blobs)
      .map { |r| r }

    assert_equal @blobs.length, list.length
    assert list.all? { |record| record.is_a?(ToyChain::Record) }
  end
end

