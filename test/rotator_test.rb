require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/rotator'

class RotatorTest < Minitest::Test

	def setup
		@rot = Rotator.new
	end

	def test_it_prints_out_the_character_map
		assert_equal @rot.character_map, "abcdefghijklmnopqrstuvwxyz0123456789 .,"
	end

	def test_it_adds_offset_a_to_rotation_a
		assert_equal @rot.a_shift_total("030315", "12345"), 21  # I pulled these test numbers from the offset_generator_test and rotation_generator_test files
		assert_equal @rot.a_shift_total("123456", "22334"), 25
		assert_equal @rot.a_shift_total("531234", "59234"), 61
	end

	def test_it_adds_offset_b_to_rotation_b
		assert_equal @rot.b_shift_total("030315", "12345"), 25  # I pulled these test numbers from the offset_generator_test and rotation_generator_test files
		assert_equal @rot.b_shift_total("123456", "22334"), 32
		assert_equal @rot.b_shift_total("531234", "59234"), 99
	end

	def test_it_adds_offset_c_to_rotation_c
		assert_equal @rot.c_shift_total("030315", "12345"), 36  # I pulled these test numbers from the offset_generator_test and rotation_generator_test files
		assert_equal @rot.c_shift_total("123456", "22334"), 36
		assert_equal @rot.c_shift_total("531234", "59234"), 28
	end

	def test_it_adds_offset_d_to_rotation_d
		assert_equal @rot.d_shift_total("030315", "12345"), 50  # I pulled these test numbers from the offset_generator_test and rotation_generator_test files
		assert_equal @rot.d_shift_total("123456", "22334"), 40
		assert_equal @rot.d_shift_total("531234", "59234"), 40
	end

end
