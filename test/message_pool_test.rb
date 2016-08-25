require_relative './test_helper.rb'
require 'message_pool.rb'
require 'message.rb'
require 'record.rb'

class TestMessagePool < Minitest::Test
  def setup
    @mp = ToyChain::MessagePool
    @rd = ToyChain::Record.new(blob: "Blob")
    @msg = ToyChain::Message.new(record: @rd)
  end

  def test_if_subclass_of_array
    assert @mp.ancestors.include?(Array)
  end

  def test_individual_blobs_can_be_pushed
    mp_instance = @mp
      .new()
      .push(@msg)

    assert_equal @msg, mp_instance.last
  end
end
