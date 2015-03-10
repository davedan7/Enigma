require_relative 'test_helper'
require_relative '../lib/offset_generator'


class OffsetGeneratorTest < Minitest::Test

	# def setup
	# 	@off = OffsetGenerator.new
	# end

	def test_it_knows_the_current_date
		off 			= OffsetGenerator.new
		time 			= Time.new
		time_key 	= time.strftime("%d%m%y")
		assert_equal off.date, time_key
		assert off.date
	end

	def test_it_has_a_digit_to_key_converter
		off = OffsetGenerator.new
		assert off.respond_to?(:digit_to_key_convert)
	end

	def test_it_returns_the_last_four_digits_of_date_squared
		off = OffsetGenerator.new("080315")
		assert_equal off.key, "9225"
	end

	def test_it_can_take_a_6_digit_number_and_produce_the_offset_number
		off = OffsetGenerator.new
		assert_equal off.digit_to_key_convert("123456"), "3936"
		assert_equal off.digit_to_key_convert("111111"), "4321"
		assert_equal off.digit_to_key_convert("531234"), "2756"
		assert_equal off.digit_to_key_convert("030315"), "9225"
	end

	def test_it_has_a_date_to_key_converter
		off = OffsetGenerator.new
		assert off.respond_to?(:key)
	end

	def test_it_takes_the_current_date_and_produces_an_offset_key
		off = OffsetGenerator.new("030315")
		assert_equal off.key, "9225"			#Numbers from current date - 3/3/15
		date_key_stubbed = OffsetGenerator.new("531234")
		assert_equal date_key_stubbed.key, "2756"
	end

	def test_index_1_is_the_first_digit_of_the_date_key
		another_key = OffsetGenerator.new("030315")
		assert_equal another_key.splits[0], 9
		key2 = OffsetGenerator.new("123456")
		assert_equal key2.splits[0], 3
	end

	def test_index_2_is_the_second_digit_of_the_date_key
		off = OffsetGenerator.new("030315")
		assert_equal off.splits[1], 2
		another_key = OffsetGenerator.new("123456")
		assert_equal another_key.splits[1], 9
		another_key = OffsetGenerator.new("531234")
		assert_equal another_key.splits[1], 7
	end

	def test_index_3_is_the_third_digit_of_the_date_key
		off 				= OffsetGenerator.new("030315")
		assert_equal off.splits[2], 2
		another_key = OffsetGenerator.new("123456")
		assert_equal another_key.splits[2], 3
		another_key = OffsetGenerator.new("531234")
		assert_equal another_key.splits[2], 5
	end

	def test_index_4_is_the_fourth_digit_of_the_date_key
		off 				= OffsetGenerator.new("030315")
		assert_equal off.splits[3], 5
		another_key = OffsetGenerator.new("123456")
		assert_equal another_key.splits[3], 6
		another_key = OffsetGenerator.new("531234")
		assert_equal another_key.splits[3], 6
	end

end
