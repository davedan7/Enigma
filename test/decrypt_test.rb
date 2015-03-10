require './lib/decrypt'
require_relative 'test_helper'

class DecryptTest < Minitest::Test

  def test_it_can_decrypt_a_letter
    a = Decrypt.new("v", "12345", "080315")
    assert_equal a.decrypt, "a"
  end

	def test_can_decrypt_two_letters
    a = Decrypt.new("vz","12345", "080315")
    assert_equal a.decrypt, "aa"
	end

  def test_can_decrypt_three_letters
    a = Decrypt.new("bob","12345", "080315")
    assert_equal a.decrypt, "t2e"
  end

  def test_can_decrypt_spaces
    a = Decrypt.new("a  b","12345", "080315")
    assert_equal a.decrypt, "sla3"
  end

  def test_can_decrypt_periods
    a = Decrypt.new("...","12345", "080315")
    assert_equal a.decrypt, "qmb"
	end

  def test_can_decrypt_commas
    a = Decrypt.new(",,,","12345", "080315")
    assert_equal a.decrypt, "rnc"
  end

  def test_it_can_decrypt_long_strings
    a = Decrypt.new("auv8rv5nuk8u..k180tn,64y7tmndvy1r6uy,k6u,6k,84x","11111", "080315")
    assert_equal a.decrypt, "this is a very long string, will this test work"
  end

  def test_it_encrypts_a_sentence
    a = Decrypt.new("4qesb7hv77z49pos9bek9aeldq0oacss0p", "13444", "020315")
    assert_equal a.decrypt, "it is all sunshine and butterflies"
  end

  def test_it_decrypts_end
    a = Decrypt.new("b3p43,ditxbyyx8", "12345", "090315")
    assert_equal a.decrypt, "testing ..end.."
  end




end
