require_relative './test_helper.rb'
require_relative '../lib/record_list.rb'
require_relative '../lib/record.rb'

class TestRecords < Minitest::Test
  def setup
    @rl = ToyChain::RecordList
  end

  def test_if_sorted_set
    assert @rl.ancestors.include?(SortedSet)
  end
end

