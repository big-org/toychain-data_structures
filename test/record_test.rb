require_relative './test_helper.rb'
require_relative '../lib/record.rb'
require_relative '../lib/hasher.rb'

class TestRecord < Minitest::Test
  def setup
    @rc = ToyChain::Record
    @record_class = ToyChain::Record
    @blob = 'Something'
    @different_blob = 'Different Blob'
    @blob_hash = ToyChain::Hasher.generate(@blob)
    @different_blob_hash = ToyChain::Hasher.generate(@different_blob)
    @record = @record_class.new(blob: @blob)
  end

  def test_create
    assert @record_class.new(blob: @blob)
  end

  def test_access_blob
    assert_equal @record.blob, @blob
  end

  def test_hash_id_exist
    assert @record.hash_id
  end

  def test_hash_id_is_unique
    assert_equal @record_class.new(blob: @blob).hash_id, @record.hash_id
  end

  def test_comparison_via_hash
    array_of_records = [
      @rc.new(blob: @blob),
      @rc.new(blob: @different_blob)
    ]
      .sort
      .map { |record| record.hash_id }

    array_of_hashes = [
      @blob_hash,
      @different_blob_hash
    ].sort

    assert_equal array_of_hashes, array_of_records
  end
end
