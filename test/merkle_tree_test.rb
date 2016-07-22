require_relative '../lib/merkle_tree.rb'
require_relative './test_helper.rb'

# TODO: Refactor the tests

module ToyChain
  class MerkleTest < Minitest::Test
    def setup
      @blob = 'A'
      @blob_2 = 'B'
      @blob_3 = 'C'
      @blobs = [1, 2.3, 'String']
      @rl = RecordList.new(blobs: @blobs)
      @m = MerkleTree
      @padder = '0'
    end

    def test_merkle_tree_can_accept_record_list
      assert @m.new(record_list: @rl).root
    end

    def test_with_single_item
      array = [@blob]
      list = RecordList.new(blobs: array)
      root = Hasher.generate(@blob)

      assert_equal root, @m.new(record_list: list).root
    end

    def test_with_two_items
      array = %w[
        Balram
        Tharadas
      ]
      list = RecordList.new(blobs: array)
      hash_array = array.map { |b| Hasher.generate(b) }.sort
      padded_array = hash_array

      root = combined_hash(*padded_array)

      assert_equal root, @m.new(record_list: list).root
    end

    def test_with_three_items
      array = %w[
        Balaji
        Andreas
        Vitalik
      ]
      list = RecordList.new(blobs: array)
      hash_array = array.map { |b| Hasher.generate(b) }.sort
      padded_array = hash_array + [BALANCER]

      second_layer = []
      second_layer << combined_hash(*padded_array[0..1])
      second_layer << combined_hash(*padded_array[2..-1])

      root = Hasher.generate(second_layer.join)

      assert_equal root, @m.new(record_list: list).root
    end

    def test_with_four_items
      array = %w[
        Red
        Green
        Blue
        Pink
      ]
      list = RecordList.new(blobs: array)
      hash_array = array.map { |b| Hasher.generate(b) }.sort
      padded_array = hash_array

      second_layer = []
      second_layer << combined_hash(*padded_array[0..1])
      second_layer << combined_hash(*padded_array[2..3])

      root = Hasher.generate(second_layer.join)

      assert_equal root, @m.new(record_list: list).root
    end

    def test_with_five_items
      array = %w[
        Matz
        Hassabis
        Witten
        Nakamoto
        Satoshi
      ]

      list = RecordList.new(blobs: array)

      hash_array = array.map { |b| Hasher.generate(b) }.sort
      padded_array = hash_array + [BALANCER] * 3

      third_layer = []
      third_layer << combined_hash(*padded_array[0..1])
      third_layer << combined_hash(*padded_array[2..3])
      third_layer << combined_hash(*padded_array[4..5])
      third_layer << combined_hash(*padded_array[6..7])

      second_layer = []
      second_layer << combined_hash(*third_layer[0..1])
      second_layer << combined_hash(*third_layer[2..3])

      root = combined_hash(*second_layer)

      assert_equal root, @m.new(record_list: list).root
    end

    def combined_hash(left, right)
      Hasher.generate([left, right].join)
    end
  end
end
