require './lib/decrypt'
require_relative 'test_helper'

class DecryptTest < Minitest::Test

  # def test_it_can_encrypt_a_letter
  #   a = Encrypt.new("a", "080315")
	# 	a.key = EncryptionKey.new("12345")
  #   assert_equal a.encrypt, "v"
  # end
  #
	# def test_can_encrypt_two_letters
  #   a = Encrypt.new("a", "080315")
	# 	a.key = EncryptionKey.new("12345")
  #   assert_equal a.encrypt, "v"
	# end

  def test_it_encrypts_a_sentence
    a = Decrypt.new("4qesb7hv77z49pos9bek9aeldq0oacss0p", "13444", "020315")
    assert_equal a.decrypt, "it is all sunshine and butterflies"
  end




end
