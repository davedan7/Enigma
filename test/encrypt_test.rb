require './lib/encrypt'
require_relative 'test_helper'

class EncryptTest < Minitest::Test

  def test_it_can_encrypt_a_letter
    a = Encrypt.new("a", "080315")
		a.key = EncryptionKey.new("12345")
    assert_equal a.encrypt, "v"
  end

	def test_can_encrypt_two_letters
    a = Encrypt.new("a", "080315")
		a.key = EncryptionKey.new("12345")
    assert_equal a.encrypt, "v"
	end

  def test_it_encrypts_a_sentence
    a = Encrypt.new("this is a test ..end..", "080315")
    a.key = EncryptionKey.new("12345")
    assert_equal a.encrypt, "b6f3s7pivwqpaf7jt3kotx"
  end




end
