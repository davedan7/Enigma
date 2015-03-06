require './lib/splitter'
require_relative 'test_helper'

class RunnerTest < Minitest::Test

	def test_it_splits_a_string_into_groups_of_four_letters
    string = Splitter.new("abcdefgh")
    assert_equal [["a","b","c","d"], ["e","f","g","h"]], string.split
  end

  def test_it_splits_the_first_index_into_group_a
    string = Splitter.new("abcdabcdabcdabcd")
    string.split
    assert_equal "aaaa", string.a
  end


end
