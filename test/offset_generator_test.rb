require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/offset_generator'


class OffsetGeneratorTest < Minitest::Test

	def setup
		@offgen = OffsetGenerator.new
	end

	def test_it_knows_the_current_date
		time = Time.new
		time_key = time.strftime("%d%m%y")
		assert_equal @offgen.date, time_key
		assert @offgen.date
	end

	def test_it_has_a_digit_to_key_converter
		assert @offgen.respond_to?(:digit_to_key_convert)
	end

	def test_it_can_take_a_6_digit_number_and_produce_the_offset_number
		assert_equal @offgen.digit_to_key_convert("123456"), "3936"
		assert_equal @offgen.digit_to_key_convert("111111"), "4321"
		assert_equal @offgen.digit_to_key_convert("531234"), "2756"
		assert_equal @offgen.digit_to_key_convert("030315"), "9225"
	end

	def test_it_has_a_date_to_key_converter
		assert @offgen.respond_to?(:key)
	end

	def test_it_takes_the_current_date_and_produces_an_offset_key
		assert_equal @offgen.key("030315"), "9225"			#Numbers from current date - 3/3/15
		date_key_stubbed = OffsetGenerator.new
		assert_equal date_key_stubbed.key("531234"), "2756"
	end

	def test_key_a_is_the_first_digit_of_the_date_key
		assert_equal @offgen.offset_a("030315"), 9
		another_key = OffsetGenerator.new
		assert_equal another_key.offset_a("123456"), 3
		another_key = OffsetGenerator.new
		assert_equal another_key.offset_a("531234"), 2
	end

	def test_key_b_is_the_second_digit_of_the_date_key
		assert_equal @offgen.offset_b("030315"), 2
		another_key = OffsetGenerator.new
		assert_equal another_key.offset_b("123456"), 9
		another_key = OffsetGenerator.new
		assert_equal another_key.offset_b("531234"), 7
	end

	def test_key_c_is_the_third_digit_of_the_date_key
		assert_equal @offgen.offset_c("030315"), 2
		another_key = OffsetGenerator.new
		assert_equal another_key.offset_c("123456"), 3
		another_key = OffsetGenerator.new
		assert_equal another_key.offset_c("531234"), 5
	end

	def test_key_d_is_the_fourth_digit_of_the_date_key
		assert_equal @offgen.offset_d("030315"), 5
		another_key = OffsetGenerator.new
		assert_equal another_key.offset_d("123456"), 6
		another_key = OffsetGenerator.new
		assert_equal another_key.offset_d("531234"), 6
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

	# def test_it_can_take_a_6_digit_number_and_produce_the_offset_number
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
