module ToyChain
  class Header
    attr_reader :version,
      :time_stamp,
      :previous_hash,
      :nonce,
      :difficulty

    def initialize(
      version:,
      time_stamp:,
      previous_hash:,
      difficulty:
    )
    end

    def set_nonce(nonce)
      @nonce = nonce
    end
  end
end
