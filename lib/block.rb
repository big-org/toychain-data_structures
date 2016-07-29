require_relative './block/header.rb'

module ToyChain
  class Block
    attr_reader :record_list, :header

    def initialize(
      record_list:,
      previous_hash:,
      difficulty:,
      version:,
      time_stamp:
    )
      @header = Header.new(
        version: version,
        time_stamp: time_stamp,
        previous_hash: previous_hash,
        difficulty: difficulty
      )
    end

    def hash_id
    end

    def set_nonce(nonce)
      @header.set_nonce(nonce)
    end
  end
end
