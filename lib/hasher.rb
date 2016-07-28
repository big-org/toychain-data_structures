require 'digest'

module ToyChain
  class Hasher
    def self.generate(object:, serializer:)
      serial = serializer.serialize(object)
      Digest::SHA256.hexdigest(serial)
    end
  end
end
