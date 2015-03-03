require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/random_classes'

class EncoderTest < Minitest::Test
end

class OffsetGeneratorTest < Minitest::Test
	def setup
		@offgen = OffsetGenerator.new
	end

end

class DateKeyGenTest < Minitest::Test

	def setup
		@key = DateKeyGen.new
	end

	def test_it_knows_the_current_date
		assert @key.date
	end

	def test_it_has_a_digit_to_key_converter
		assert @key.respond_to?(:digit_to_key_convert)
	end

	def test_it_can_take_a_6_digit_number_and_produce_the_offset_number
		assert_equal @key.digit_to_key_convert("123456"), "3936"
		assert_equal @key.digit_to_key_convert("111111"), "4321"
		assert_equal @key.digit_to_key_convert("531234"), "2756"
	end

	def test_it_has_a_date_to_key_converter
		assert @key.respond_to?(:key)
	end

	def test_it_takes_the_current_date_and_produces_an_offset_key #Will have to change this to test for current date
		assert_equal @key.key, "9225" 
	end
end

class RotationGeneratorTest < Minitest::Test
end
