require 'digest'
module ToyChain
  class Hasher
    def self.generate(object)
      Digest::SHA256.hexdigest object.to_s
    end
  end
end
