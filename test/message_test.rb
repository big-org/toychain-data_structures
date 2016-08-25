require_relative './test_helper.rb'
require 'message.rb'
require 'hasher.rb'
require 'serializer.rb'

module ToyChain
class TestMessage < Minitest::Test
  def setup
    blob = 'BLOB'
    @record = Record.new(blob: blob)
  end

  def test_message_hash
    msg = Message.new(record: @record)
    assert ToyChain::Hasher.generate(object: msg, serializer: Serializer), msg.hash_id
  end

  def test_message_can_be_initiated_with_record
    assert @record, Message.new(record: @record).record
  end
end
end
