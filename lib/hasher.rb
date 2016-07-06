require 'digest'
module ToyChain
  class Hasher
    def self.generate(object)
      Digest::SHA256.hexdigest object
    end
  end
end
