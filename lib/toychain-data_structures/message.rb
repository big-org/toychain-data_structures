require_relative './hasher.rb'
require_relative './serializer.rb'

module ToyChain
  class Message
    attr_reader :record

    def initialize(record:)
      @record = record
    end
    
    def hash_id
      ToyChain::Hasher.generate(object: self, serializer: Serializer)
    end

  end
end
