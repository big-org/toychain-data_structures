require_relative '../test_helper.rb'
require_relative '../../lib/message_pool.rb'
require_relative '../../lib/node/node.rb'

module ToyChain
  class TestNode < Minitest::Test
    def setup
      @message_pool = MessagePool
      @node = Node
      @n = @node.new
    end

    def test_create
      assert @node.new
    end

    def test_node_check_message_pool
      assert_equal @n.message_pool.class, @message_pool
    end

  end
end
