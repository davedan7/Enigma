# require 'minitest'
# require 'minitest/autorun'
# require 'minitest/pride'
require_relative '../lib/encryptor'
require_relative 'test_helper'

class EncryptorTest < Minitest::Test

  def test_it_converts_a_to_b_if_shift_is_one
    enc = Encryptor.new(1)
    assert_equal enc.encrypt("a"), "b"
  end

  def test_it_converts_a_to_c_if_shift_is_two
    enc = Encryptor.new(2)
    assert_equal enc.encrypt("a"), "c"
  end

  def test_it_converts_a_to_d_if_shift_is_three
    enc = Encryptor.new(3)
    assert_equal enc.encrypt("a"), "d"
  end

  def test_it_converts_two_letters_by_one_index_shift
    enc = Encryptor.new(1)
    assert_equal enc.encrypt("ab"), "bc"
  end

  def test_it_converts_two_letters_by_two_index_shifts
    enc = Encryptor.new(2)
    assert_equal enc.encrypt("ab"), "cd"
  end

  def test_it_can_convert_a_space
    enc = Encryptor.new(1)
    assert_equal enc.encrypt(" "), "."
  end

  def test_it_can_the_final_character_in_map
    enc = Encryptor.new(1)
    assert_equal enc.encrypt(","), "a"
  end

  def test_it_converts_a_word_one_index
    enc = Encryptor.new(1)
    assert_equal enc.encrypt("abcd"), "bcde"
  end

  def test_it_converts_two_words
    enc = Encryptor.new(1)
    assert_equal enc.encrypt("abcd test"), "bcde.uftu"
  end

  def test_it_can_convert_a_letter_to_index_greater_than_the_length_of_character_map
    enc = Encryptor.new(40)
    assert_equal enc.encrypt("a"), "b"
  end

end
