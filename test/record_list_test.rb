require_relative './test_helper.rb'
require 'record_list.rb'
require 'record.rb'

class TestRecords < Minitest::Test
  def setup
    @rl = ToyChain::RecordList
    @blobs = ['Nikhil', 4,'A', '23', 'Rakesh', 1, 2, 10, "ABD", "Test"]
    @blob = 'Individual Blob'
    @record_from_blob = ToyChain::Record.new(blob: @blob)

    @rl_blobs = ToyChain::RecordList.new(blobs: @blobs)

    @rl_pushed = ToyChain::RecordList.new(blobs: [])
    @blobs.each do |b|
      @rl_pushed.push(b)
    end

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

  def test_records_are_received_in_sorted_order
    assert_equal @rl_blobs, @sorted_blob_hashes
  end

  def test_records_are_pushed_in_sorted_order
    assert_equal @rl_pushed, @sorted_blob_hashes
  end
end

