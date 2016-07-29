require_relative './test_helper.rb'
require_relative '../lib/serializer.rb'

module ToyChain
  class TestSerializer < Minitest::Test
    class SimpleClass
      def initialize(name:, age:)
        @name = name
        @age = age
      end
    end

    def setup
      @s = Serializer
      @object_1 = SimpleClass.new(name: 'A', age: 23)
      @object_2 = SimpleClass.new(name: 'B', age: 43)

      @object_same_1 = SimpleClass.new(name: 'A', age: 23)
    end

    def test_serialize_method_exist
      assert @s.serialize(@object_1)
    end

    def test_two_objects_with_different_state_has_different_serialization
      refute_equal @s.serialize(@object1), @s.serialize(@object_2)
    end

    def test_two_objects_with_same_state_has_same_serialization
      assert_equal @s.serialize(@object_1), @s.serialize(@object_same_1)
    end

  end
end
