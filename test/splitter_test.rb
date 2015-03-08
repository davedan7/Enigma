require './lib/splitter'
require_relative 'test_helper'

class RunnerTest < Minitest::Test

	def test_it_splits_a_string_into_groups_of_four_letters
    string = Splitter.new("abcdefgh")
    assert_equal [["a","b","c","d"], ["e","f","g","h"]], string.split
    string2 = Splitter.new("aaaabbbb")
    assert_equal [["a","a","a","a"], ["b","b","b","b"]], string2.split
  end

  def test_it_splits_the_first_index_into_group_a
    string = Splitter.new("abcdabcdabcdabcd")
    string.split
    assert_equal "aaaa", string.a
  end

  def test_it_splits_the_first_index_into_group_b
    string = Splitter.new("abcdabcdabcdabcd")
    string.split
    assert_equal "bbbb", string.b
  end

  def test_it_splits_the_first_index_into_group_c
    string = Splitter.new("abcdabcdabcdabcd")
    string.split
    assert_equal "cccc", string.c
  end

  def test_it_splits_the_first_index_into_group_d
    string = Splitter.new("abcdabcdabcdabcd")
    string.split
    assert_equal "dddd", string.d
  end

end
