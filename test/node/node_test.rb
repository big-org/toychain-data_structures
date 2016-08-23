require_relative '../test_helper.rb'
require_relative '../../lib/message_pool.rb'
require_relative '../../lib/node/node.rb'

module ToyChain
  class TestNode < Minitest::Test
    def setup
      @message_pool = MessagePool
      @node = Node
      @n = @node.new(config_file: './lib/node/node_config.json')
    end

    def test_create
      assert @n
    end

    def test_node_check_message_pool
      assert_equal @n.message_pool.class, @message_pool
    end

    def test_node_loads_configuration
      assert @n.configuration
    end

  end
end
