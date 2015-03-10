require './lib/encrypt'
require_relative 'test_helper'

class EncryptTest < Minitest::Test

  def test_it_can_encrypt_a_letter
    a = Encrypt.new("a")
    a.offset.date = "080315"
		a.key = EncryptionKey.new("12345")
    assert_equal a.encrypt, "v"
  end

	def test_can_encrypt_two_letters
    a = Encrypt.new("aa")
    a.offset.date = "080315"
		a.key = EncryptionKey.new("12345")
    assert_equal a.encrypt, "vz"
	end

  def test_can_encrypt_three_letters
    a = Encrypt.new("aaa")
    a.offset.date = "080315"
		a.key = EncryptionKey.new("12345")
    assert_equal a.encrypt, "vz "
	end

  def test_can_encrypt_spaces
    a = Encrypt.new("a b")
    a.offset.date = "080315"
    a.key = EncryptionKey.new("12345")
    assert_equal a.encrypt, "vw."
  end

  def test_can_encrypt_periods
    a = Encrypt.new("...")
    a.offset.date = "080315"
		a.key = EncryptionKey.new("12345")
    assert_equal a.encrypt, "tx8"
	end

  def test_can_encrypt_commas
    a = Encrypt.new(",,,")
    a.offset.date = "080315"
    a.key = EncryptionKey.new("12345")
    assert_equal a.encrypt, "uy9"
  end

  def test_can_encrypt_long_strings
    a = Encrypt.new("this is a very long string, will this test work")
    a.offset.date = "030815"
		a.key = EncryptionKey.new("11111")
    assert_equal a.encrypt, "auv8rv5nuk8u..k180tn,64y7tmndvy1r6uy,k6u,6k,84x"
	end

  # I added some of the following specificlaly to test file i/o using keys/strings where I already had the return value
  def test_it_encrypts_a_sentence
    a = Encrypt.new("this is a test ..end..")
    a.offset.date = "080315"
    a.key = EncryptionKey.new("12345")
    assert_equal a.encrypt, "b6f3s7pivwqpaf7jt3kotx"
  end

  def test_it_encrypts_another_sentence
    a = Encrypt.new("it is all sunshine and butterflies")
    a.offset.date = "020315"
    a.key = EncryptionKey.new("13444")
    assert_equal a.encrypt, "4qesb7hv77z49pos9bek9aeldq0oacss0p"
  end

  def test_it_encrypts_YET_another_sentence
    a = Encrypt.new("this is a test")
    a.offset.date = "090315"
    a.key = EncryptionKey.new("31577")
    assert_equal a.encrypt, "uy2w.z,bboait "
  end

  def test_argv
    a = Encrypt.new("this is a test")
    a.offset.date = "090315"
    a.key = EncryptionKey.new("91032")
    assert_equal a.encrypt, "ctnqtux8wjycb5"
  end

  def test_end
    a = Encrypt.new("testing ..end..")
    a.offset.date = "090315"
    a.key = EncryptionKey.new("12345")
    assert_equal a.encrypt, "b3p43,ditxbyyx8"
  end

end
