module ToyChain
  class Header
    attr_reader :merkle_root,
      :version,
      :time_stamp,
      :previous_hash,
      :nonce,
      :difficulty

    def initialize(
      merkle_root:,
      version:,
      time_stamp:,
      previous_hash:,
      nonce:,
      difficulty:
    )
    end
  end
end
