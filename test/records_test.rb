require_relative './test_helper.rb'
require_relative '../lib/records.rb'
require_relative '../lib/record.rb'

class TestRecords < Minitest::Test
  def setup 
    @record_class = ToyChain::Record
    @records_class = ToyChain::Record_List

     @record1 = @record_class.new(blob: 'one')
     @record2 = @record_class.new(blob: 'two')
  end

  def test_create_single
    assert @records_class.new(record: @record1, previous_hash:  nil)
  end

  def test_create_multiple
    previous_record = @records_class.new(record: @record1, previous_hash: nil)
    assert @records_class.new(record: @record2, previous_hash: previous_record.record_hash)
  end
end

