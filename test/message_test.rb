require_relative './test_helper.rb'
require_relative '../lib/message.rb'

module ToyChain
class TestMessage < Minitest::Test
  def setup
    blob = 'BLOB'
    @record = Record.new(blob: blob)
  end

  def test_message_can_be_initiated_with_record
    assert @record, Message.new(record: @record).record
  end
end
end
