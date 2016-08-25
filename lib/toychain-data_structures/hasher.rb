require 'digest'

module ToyChain
  class Hasher
    def self.generate(object:, serializer:)
      Digest::SHA256.hexdigest(serializer.serialize(object))
    end
  end
end
