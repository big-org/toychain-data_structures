module ToyChain
  class Record
    attr_reader :blob

    def initialize(blob:)
      @blob = blob
    end

    def hash_pointer
      3
    end
  end
end
