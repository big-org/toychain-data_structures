require_relative './record.rb'

module ToyChain
  class RecordList < Array
    def initialize(blobs:)
      super blobs.map { |blob| Record.new(blob: blob) }
      sort!
    end

    def push(blob)
      super Record.new(blob: blob)
      sort!
    end
  end
end
