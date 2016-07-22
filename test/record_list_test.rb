require_relative './test_helper.rb'
require_relative '../lib/record_list.rb'
require_relative '../lib/record.rb'

class TestRecords < Minitest::Test
  def setup
    @rl = ToyChain::RecordList
    @blobs = [1, 'Nikhil', 'Rakesh']
    @blob = 'Individual Blob'
    @record_from_blob = ToyChain::Record.new(blob: @blob)

    @rl_blobs = ToyChain::RecordList.new(blobs: @blobs)

    @sorted_blob_hashes = @blobs
      .map { |b| ToyChain::Record.new(blob: b) }
      .sort { |l, r| l.hash_id <=> r.hash_id }
  end

  def test_if_subclass_of_array
    assert @rl.ancestors.include?(Array)
  end

  def test_constructor_can_accept_blob
    @rl_blobs = @rl
      .new(blobs: @blobs)

    assert_equal @blobs.length, @rl_blobs.length
    assert @rl_blobs.all? { |record| record.is_a?(ToyChain::Record) }
  end

  def test_individual_blobs_can_be_pushed
    rl_instance = @rl
      .new(blobs: [])
      .push(@blob)

    assert_equal @record_from_blob, rl_instance.last
  end

  def test_records_are_recived_in_sorted_order
    assert_equal @rl_blobs, @sorted_blob_hashes
  end
end

