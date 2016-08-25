require_relative './test_helper.rb'
require 'record.rb'
require 'hasher.rb'
require 'serializer.rb'

module ToyChain
  class TestRecord < Minitest::Test
    def setup
      @rc = Record
      @s = Serializer
      @record_class = Record
      @blob = 'Something'
      @different_blob = 'Different Blob'
      @blob_hash = Hasher.generate(object: @blob, serializer: @s)
      @different_blob_hash = Hasher.generate(object: @different_blob, serializer: @s)
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

    def test_records_with_same_blobs_return_true_on_comparison
      assert_equal @rc.new(blob: @blob), @rc.new(blob: @blob)
    end
  end
end
