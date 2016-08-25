require_relative '../test_helper.rb'
require 'message_pool.rb'
require 'node.rb'

module ToyChain
  class TestNode < Minitest::Test
    def setup
      @message_pool = MessagePool
      @node = Node
      config_file = './lib/toychain-data_structures/node/node_config.json'
      @n = @node.new(config_file: config_file)
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
