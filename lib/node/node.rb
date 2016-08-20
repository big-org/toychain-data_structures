require_relative '../message_pool.rb'

module ToyChain
  class Node
    attr_reader :message_pool

    def initialize
      @message_pool = MessagePool.new
    end

  end
end

