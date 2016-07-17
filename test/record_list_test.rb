require_relative './test_helper.rb'
require_relative '../lib/record_list.rb'
require_relative '../lib/record.rb'

class TestRecords < Minitest::Test
  def setup
    @rl = ToyChain::RecordList
    @blobs = [1, 'Nikhil', 'Rakesh']
  end

  def test_if_sorted_set
    assert @rl.ancestors.include?(SortedSet)
  end

  def test_constructor_can_accept_blob
    blobset = @rl
      .new(@blobs)
      .each { |r| r }

    assert_equal @blobs.length, blobset.length 
    assert blobset.all? { |record| record.is_a?(ToyChain::Record) }
  end
end

