class RotationGenerator

	def initialize(encryption_key = nil)
		@encryption_key = encryption_key
	end

	def rotation_a
		@encryption_key[0..1].to_i
	end

	def rotation_b
		@encryption_key[1..2].to_i
	end

	def rotation_c
		@encryption_key[2..3].to_i
	end

	def rotation_d
		@encryption_key[3..4].to_i
	end

end



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
