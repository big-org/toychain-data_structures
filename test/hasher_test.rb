require_relative './test_helper.rb'
require_relative '../lib/hasher.rb'
require 'digest'

class TestHasher < Minitest::Test
  def setup
    @hasher_class = ToyChain::Hasher
    @object = 'Object'
  end

  def test_generate_exist
    assert @hasher_class.respond_to?(:generate)
  end

  def test_hashability
    assert @hasher_class.generate(@object)
  end

  def test_equality
    object1 = 'Jon Snow'
    object2 = 'Nikola Tesla'

    h1 = @hasher_class.generate(object1)
    h2 = @hasher_class.generate(object1)

    assert_equal h1, h2
  end

  #The hash being tested for is SHA-256.
  #Need to update this if we use a different hashing algorithm
  def test_hashed_value
    object1 = 'Jon Snow'
    sha_hash = Digest::SHA256.hexdigest object1
    h1 = @hasher_class.generate(object1)
    assert_equal sha_hash, h1
  end

end
