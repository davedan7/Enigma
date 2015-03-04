require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryption_key.rb'

class KeyGeneratorTest < Minitest::Test

  def test_it_creates_5_random_numbers # there's a very small change this will return true
		key1 = EncryptionKey.new
		key2 = EncryptionKey.new
		refute_equal key1.encryption_key, key2.encryption_key
		key3 = EncryptionKey.new
		refute_equal key1.encryption_key, key3.encryption_key
		refute_equal key2.encryption_key, key3.encryption_key
	end
end
