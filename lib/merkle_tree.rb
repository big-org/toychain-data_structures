require_relative './record_list.rb'

module ToyChain
  PADDER = 0

  class MerkleTree
    def initialize(record_list:)
      @record_list = record_list
    end

    def root
      power_of_two
        .times
        .reduce(hashes) do |interim_parent, _|
        interim_parent
          .each_slice(2)
          .map do |pair|
          Hasher.generate(pair.join)
        end
      end
        .first
    end

    def length
      @record_list.length
    end

    def hashes
      @hashes ||= pad!
    end

    private

    def power_of_two
      Math
        .log2(length)
        .ceil
    end

    def pad!
      just_hashes = @record_list
        .map(&:hash_id)

      pad = 2**power_of_two - length
      just_hashes + [PADDER] * pad
    end
  end
end
