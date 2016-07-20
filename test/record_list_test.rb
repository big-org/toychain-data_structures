require_relative './test_helper.rb'
require_relative '../lib/record_list.rb'
require_relative '../lib/record.rb'

class TestRecords < Minitest::Test
  def setup
    @rl = ToyChain::RecordList
    @blobs = [1, 'Nikhil', 'Rakesh']
    @blob = 'Individual Blob'
    @record_from_blob = ToyChain::Record.new(blob: @blob)
  end

  def test_if_sorted_set
    assert @rl.ancestors.include?(Array)
  end

  def test_constructor_can_accept_blob
    blobset = @rl
      .new(blobs: @blobs)

    assert_equal @blobs.length, blobset.length
    assert blobset.all? { |record| record.is_a?(ToyChain::Record) }
  end

  def test_individual_blobs_can_be_pushed
    rl_instance = @rl
      .new(blobs: [])
      .push(@blob)

    assert_equal @record_from_blob, rl_instance.last
  end
end

