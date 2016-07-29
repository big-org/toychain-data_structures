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
      nonce:,
      difficulty:
    )
    end
  end
end
