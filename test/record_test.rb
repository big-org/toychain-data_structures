require_relative './test_helper.rb'
require_relative '../lib/record.rb'

class TestRecord < Minitest::Test
  def setup
    @record_class = ToyChain::Record
    @blob = 'Something'
    @different_blob = 'Different Blob'
    @record = @record_class.new(blob: @blob)
  end

  def test_create
    assert @record_class.new(blob: @blob)
  end

  def test_access_blob
    assert_equal @record.blob, @blob
  end

  def test_hash_pointer_exist
    assert @record.hash_pointer
  end

  def test_hash_pointer_is_unique
    assert_equal @record_class.new(blob: @blob).hash_pointer, @record.hash_pointer
  end

end
