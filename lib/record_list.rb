require 'set'
require_relative './record.rb'

module ToyChain
  class RecordList < Array
    def initialize(blobs:)
      blobs.each do |blob|
        push Record.new(blob: blob)
      end
    end

    def push(element)
      super element
      sort!
      element
    end
  end
end
