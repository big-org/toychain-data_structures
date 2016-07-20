require 'set'
require_relative './record.rb'

module ToyChain
  class RecordList < Array
    def initialize(blobs:)
      super blobs.map { |blob| Record.new(blob: blob) }
    end

    def push(blob)
      super Record.new(blob: blob)
    end
  end
end
