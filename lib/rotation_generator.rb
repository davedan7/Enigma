require_relative 'encryption_key'

class RotationGenerator

	attr_accessor :key

	def initialize(key = nil)
		@key = key
	end

	def splits(key = @key)
		[key[0..1].to_i, key[1..2].to_i, key[2..3].to_i, key[3..4].to_i]
	end

	# def a(key = @key)
	# 	key[0..1].to_i
	# end
	#
	# def b(key = @key)
	# 	key[1..2].to_i
	# end
	#
	# def c(key = @key)
	# 	key[2..3].to_i
	# end
	#
	# def d(key = @key)
	# 	key[3..4].to_i
	# end

	# def splits					# array of the different splits. Can match thsi with the offsets to get the total shit number
	# 	[a, b, c, d]
	# end

end
# 
# key = EncryptionKey.new("12345")
# test = RotationGenerator.new(key.key)
# print test.key
# print test.splits
# puts test.splits[1]
# # print test.a
# print test.b
# print test.c
