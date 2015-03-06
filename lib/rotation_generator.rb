

class RotationGenerator
	attr_reader :key

	def initialize(key = nil)
		@key = key
	end

	def generate_key
    nums = []
    5.times {nums << rand(10)}
    @key = nums.join
  end

	def a(key = @key)
		@key[0..1].to_i
	end

	def b(key = @key)
		@key[1..2].to_i
	end

	def c(key = @key)
		@key[2..3].to_i
	end

	def d(key = @key)
		@key[3..4].to_i
	end

end

# test = RotationGenerator.new
# test.generate_key
# puts test.key
# puts test.key
# puts test.b
# puts test.c


# class EncryptionKey
# 	attr_reader :encryption_key
#
#   def encryption_key
#     nums = []
#     5.times {nums << rand(10)}
#     nums.join
#   end
#
# end
# test = KeyGenerator.new
# 10.times {puts test.encryption_key}
# 5.times {puts test.rotation_a}
