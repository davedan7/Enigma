# require 'minitest'
# require 'minitest/autorun'
# require 'minitest/pride'
require './lib/rotation_generator'
require './test/test_helper'

class RotationGeneratorTest < Minitest::Test

	def setup
		@keygen = RotationGenerator.new
	end

	def test_rotation_a_is_the_first_two_digits_of_encryption_key
		key = RotationGenerator.new("12345")
		assert_equal key.rotation_a, 12
		key = RotationGenerator.new("22334")
		assert_equal key.rotation_a, 22
		key = RotationGenerator.new("59234")
		assert_equal key.rotation_a, 59
	end

	def test_rotation_b_is_the_second_and_third_digits_of_encryption_key
		key = RotationGenerator.new("12345")
		assert_equal key.rotation_b, 23
		key = RotationGenerator.new("22334")
		assert_equal key.rotation_b, 23
		key = RotationGenerator.new("59234")
		assert_equal key.rotation_b, 92
	end

	def test_rotation_c_is_the_third_and_fourth_digits_of_encryption_key
		key = RotationGenerator.new("12345")
		assert_equal key.rotation_c, 34
		key = RotationGenerator.new("22334")
		assert_equal key.rotation_c, 33
		key = RotationGenerator.new("59234")
		assert_equal key.rotation_c, 23
	end

	def test_rotation_d_is_the_fourth_and_fifth_digits_of_encryption_key
		key = RotationGenerator.new("12345")
		assert_equal key.rotation_d, 45
		key = RotationGenerator.new("22334")
		assert_equal key.rotation_d, 34
		key = RotationGenerator.new("59234")
		assert_equal key.rotation_d, 34
	end
end
