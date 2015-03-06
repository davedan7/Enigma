# require 'minitest'
# require 'minitest/autorun'
# require 'minitest/pride'
require_relative 'test_helper'
require_relative '../lib/offset'


class OffsetTest < Minitest::Test

	def setup
		@off = Offset.new
	end

	def test_it_knows_the_current_date
		time = Time.new
		time_key = time.strftime("%d%m%y")
		assert_equal @off.date, time_key
		assert @off.date
	end

	def test_it_has_a_digit_to_key_converter
		assert @off.respond_to?(:digit_to_key_convert)
	end

	def test_it_can_take_a_6_digit_number_and_produce_the_offset_number
		assert_equal @off.digit_to_key_convert("123456"), "3936"
		assert_equal @off.digit_to_key_convert("111111"), "4321"
		assert_equal @off.digit_to_key_convert("531234"), "2756"
		assert_equal @off.digit_to_key_convert("030315"), "9225"
	end

	def test_it_has_a_date_to_key_converter
		assert @off.respond_to?(:key)
	end

	def test_it_takes_the_current_date_and_produces_an_offset_key
		assert_equal @off.key("030315"), "9225"			#Numbers from current date - 3/3/15
		date_key_stubbed = Offset.new
		assert_equal date_key_stubbed.key("531234"), "2756"
	end

	def test_key_a_is_the_first_digit_of_the_date_key
		assert_equal @off.a("030315"), 9
		another_key = Offset.new
		assert_equal another_key.a("123456"), 3
		another_key = Offset.new
		assert_equal another_key.a("531234"), 2
	end

	def test_key_b_is_the_second_digit_of_the_date_key
		assert_equal @off.b("030315"), 2
		another_key = Offset.new
		assert_equal another_key.b("123456"), 9
		another_key = Offset.new
		assert_equal another_key.b("531234"), 7
	end

	def test_key_c_is_the_third_digit_of_the_date_key
		assert_equal @off.c("030315"), 2
		another_key = Offset.new
		assert_equal another_key.c("123456"), 3
		another_key = Offset.new
		assert_equal another_key.c("531234"), 5
	end

	def test_key_d_is_the_fourth_digit_of_the_date_key
		assert_equal @off.d("030315"), 5
		another_key = Offset.new
		assert_equal another_key.d("123456"), 6
		another_key = Offset.new
		assert_equal another_key.d("531234"), 6
	end

end

# class DateKeyGenTest < Minitest::Test

	# def setup
	# 	@date_key = DateKeyGen.new
	# end

	# def test_it_knows_the_current_date
	# 	time = Time.new
	# 	time_key = time.strftime("%d%m%y")
	# 	assert_equal @date_key.date, time_key
	# 	assert @date_key.date
	# end

	# def test_it_has_a_digit_to_key_converter
	# 	assert @date_key.respond_to?(:digit_to_key_convert)
	# end

	# def test_it_can_take_a_6_digit_number_and_produce_the_number
	# 	assert_equal @date_key.digit_to_key_convert("123456"), "3936"
	# 	assert_equal @date_key.digit_to_key_convert("111111"), "4321"
	# 	assert_equal @date_key.digit_to_key_convert("531234"), "2756"
	# end

	# def test_it_has_a_date_to_key_converter
	# 	assert @date_key.respond_to?(:key)
	# end

	# def test_it_takes_the_current_date_and_produces_an_offset_key #Will have to change this to test for current date
	# 	assert_equal @date_key.key("030315"), "9225"			#Numbers from current date - 3/3/15
	# 	date_key_stubbed = DateKeyGen.new
	# 	# date_key_stubbed.key("531234")
	# 	assert_equal date_key_stubbed.key("531234"), "2756"
	# end
# end
