require 'json'
require_relative '../message_pool.rb'

module ToyChain
  class Node
    attr_reader :message_pool, :configuration

    def initialize(config_file:)
      @message_pool = MessagePool.new
      read_config(config_file)
    end

    def read_config(file_path)
      contents = File.open(file_path, 'r').read
      @configuration = JSON.parse(contents)
    end

  end
end

