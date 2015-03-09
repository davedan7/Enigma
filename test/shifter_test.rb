# require 'minitest'
# require 'minitest/autorun'
# require 'minitest/pride'
require_relative '../lib/shifter'
require_relative 'test_helper'

class ShifterTest < Minitest::Test

  def test_it_converts_a_to_b_if_shift_is_one
    enc = Shifter.new(1)
    assert_equal enc.encrypt("a"), "b"
  end

  def test_it_converts_a_to_c_if_shift_is_two
    enc = Shifter.new(2)
    assert_equal enc.encrypt("a"), "c"
  end

  def test_it_converts_a_to_d_if_shift_is_three
    enc = Shifter.new(3)
    assert_equal enc.encrypt("a"), "d"
  end

  def test_it_converts_two_letters_by_one_index_shift
    enc = Shifter.new(1)
    assert_equal enc.encrypt("ab"), "bc"
  end

  def test_it_converts_two_letters_by_two_index_shifts
    enc = Shifter.new(2)
    assert_equal enc.encrypt("ab"), "cd"
  end

  def test_it_can_convert_a_space
    enc = Shifter.new(1)
    assert_equal enc.encrypt(" "), "."
  end

  def test_it_can_the_final_character_in_map
    enc = Shifter.new(1)
    assert_equal enc.encrypt(","), "a"
  end

  def test_it_converts_a_word_one_index
    enc = Shifter.new(1)
    assert_equal enc.encrypt("abcd"), "bcde"
  end

  def test_it_converts_two_words
    enc = Shifter.new(1)
    assert_equal enc.encrypt("abcd test"), "bcde.uftu"
  end

  def test_it_can_convert_a_letter_to_index_greater_than_the_length_of_character_map
    enc = Shifter.new(40)
    assert_equal enc.encrypt("a"), "b"
  end

  def test_it_can_decrypt_a_set_string
    enc = Shifter.new(1)
    assert_equal "bcde", enc.decrypt("cdef")
  end

  def test_it_can_decrypt_a_string_saved_as_a_variable
    enc = Shifter.new(1)
    crypt = enc.encrypt("bcde")
    assert_equal "bcde", enc.decrypt(crypt)
  end

  def test_it_can_decrypt_two_strings
    enc = Shifter.new(1)
    assert_equal "bcde fghi", enc.decrypt("cdef.ghij")
  end

  def test_it_can_decrypt_two_strings_set_as_variable
    enc = Shifter.new(1)
    crypt = enc.encrypt("bcde fghi")
    assert_equal "bcde fghi", enc.decrypt(crypt)
  end

end
