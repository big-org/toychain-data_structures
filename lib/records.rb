require_relative './hasher.rb'

module ToyChain
  class Record_List
    attr_reader :record, :record_hash, :previous_hash
    
    def initialize(record:,previous_hash:)
       @record = record
       @record_hash = Hasher.generate(@record.serialize_record)
       @previous_hash = previous_hash
    end 
  end  
 end
           
