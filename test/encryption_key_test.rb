# require 'minitest'
# require 'minitest/autorun'
# require 'minitest/pride'
require './lib/encryption_key.rb'
require './test/test_helper'

class KeyGeneratorTest < Minitest::Test

  def test_it_creates_5_random_numbers # there's a very small change this will return true
		key1 = EncryptionKey.new
		key2 = EncryptionKey.new
		refute_equal key1.key, key2.key
		key3 = EncryptionKey.new
		refute_equal key1.key, key3.key
		refute_equal key2.key, key3.key
		key4 = EncryptionKey.new
		refute_equal key2.key, key4.key
		refute_equal key3.key, key4.key
	end

  def test_it_can_be_stubbed
    key1 = EncryptionKey.new("12345")
    key2 = EncryptionKey.new("12345")
    key3 = EncryptionKey.new("11111")
    assert_equal key2.key, key1.key
    refute_equal key3.key, key1.key
    refute_equal key3.key, key2.key
  end
end
