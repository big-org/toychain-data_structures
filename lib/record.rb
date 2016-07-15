require_relative './hasher.rb'

module ToyChain
  class Record
    attr_reader :blob

    def initialize(blob:)
      @blob = blob
    end

    def hash_id
      ToyChain::Hasher.generate(@blob)
    end

    def serialize_record
      blob.to_s + ":" + hash_id
    end

    def <=>(other)
      hash_id <=> other.hash_id
    end
  end
end
