# require 'minitest'
# require 'minitest/autorun'
# require 'minitest/pride'
require './lib/rotation_generator'
require_relative 'test_helper'

class RotationGeneratorTest < Minitest::Test

	def setup
		@keygen = RotationGenerator.new
	end

	def test_rotation_a_is_the_first_two_digits_of_encryption_key
		assert_equal @keygen.rotation_a("12345"), 12
		assert_equal @keygen.rotation_a("22334"), 22
		assert_equal @keygen.rotation_a("59234"), 59
	end

	def test_rotation_b_is_the_second_and_third_digits_of_encryption_key
		assert_equal @keygen.rotation_b("12345"), 23
		assert_equal @keygen.rotation_b("22334"), 23
		assert_equal @keygen.rotation_b("59234"), 92
	end

	def test_rotation_c_is_the_third_and_fourth_digits_of_encryption_key
		assert_equal @keygen.rotation_c("12345"), 34
		assert_equal @keygen.rotation_c("22334"), 33
		assert_equal @keygen.rotation_c("59234"), 23
	end

	def test_rotation_d_is_the_fourth_and_fifth_digits_of_encryption_key
		assert_equal @keygen.rotation_d("12345"), 45
		assert_equal @keygen.rotation_d("22334"), 34
		assert_equal @keygen.rotation_d("59234"), 34
	end
end
