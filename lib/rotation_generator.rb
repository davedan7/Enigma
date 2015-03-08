require_relative 'encryption_key'

class RotationGenerator

	attr_accessor :key

	def initialize(key = nil)
		@key = key
	end

  # def generate_key
  #   nums = []
  #   5.times {nums << rand(10)}
  #   @key = nums.join
  # end

	def a(key = @key)
		key[0..1].to_i
	end

	def b(key = @key)
		key[1..2].to_i
	end

	def c(key = @key)
		key[2..3].to_i
	end

	def d(key = @key)
		key[3..4].to_i
	end

end

# key = EncryptionKey.new("12345")
# test = RotationGenerator.new(key.key)
# # print test.key
# print test.a
# print test.b
# print test.c
