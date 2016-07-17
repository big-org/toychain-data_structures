require 'set'
require_relative './record.rb'

module ToyChain
  class RecordList < SortedSet 
    def initialize blobs 
      super  blobs.map { |blob| Record.new(blob: blob) }
    end
  end
end
