require_relative './record.rb'

module ToyChain
  class RecordList < Array
    def initialize(blobs:)
      super blobs.map { |blob| Record.new(blob: blob) }
      sort!
    end

    def push(blob)
      record = Record.new(blob: blob)
      index_for_insertion = find_index_for_inserting(record)
      self.insert(index_for_insertion, record)
    end

    def find_index_for_inserting(record)
      index = 0
      while (index < self.length)
        r = self[index]
        break if record.hash_id < r.hash_id
        index += 1
      end
      index
    end
  end
end
