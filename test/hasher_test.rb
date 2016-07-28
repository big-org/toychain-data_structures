require_relative './test_helper.rb'
require_relative '../lib/hasher.rb'
require_relative '../lib/serializer.rb'
require 'digest'

module ToyChain
  class TestHasher < Minitest::Test
    def setup
      @integer = 2
      @integer_string = @integer.to_s
      @hasher_class = ToyChain::Hasher
      @object = 'Object'
      @s = Serializer
    end

    def test_generate_exist
      assert @hasher_class.respond_to?(:generate)
    end

    def test_hashability
      assert @hasher_class.generate(object: @object, serializer: @s)
    end

    def test_equality
      object1 = 'Jon Snow'

      h1 = @hasher_class.generate(object: object1, serializer: @s)
      h2 = @hasher_class.generate(object: object1, serializer: @s)

      assert_equal h1, h2
    end

    # The hash being tested for is SHA-256.
    # Need to update this if we use a different hashing algorithm
    def test_hashed_value
      object1 = 'Jon Snow'
      sha_hash = Digest::SHA256.hexdigest Serializer.serialize(object1)
      h1 = @hasher_class.generate(object: object1, serializer: @s)
      assert_equal sha_hash, h1
    end
  end
end
