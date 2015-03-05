require_relative './encryption_key'
require_relative './offset_generator'
require_relative './rotation_generator'

class ShiftTotal

	# def initialize
	# 	@encryption_key = EncryptionKey.new
	# 	@offset = OffsetGenerator.new
	# 	@rotation = RotationGenerator.new
	# end

	# def character_map
	# 	[*('a'..'z'), *('0'..'9'), " ", ".", ","].join
	# end

	def a_shift_total(offset = @offset.date, rotation = @encryption_key.encryption_key)
		@offset.offset_a(offset) + @rotation.rotation_a(rotation)
		# @offset.offset_a("030315") + @rotation.rotation_a("123456")
	end

	def b_shift_total(offset = @offset.date, rotation = @encryption_key.encryption_key)
		@offset.offset_b(offset) + @rotation.rotation_b(rotation)
		# @offset.offset_a("030315") + @rotation.rotation_a("123456")
	end

	def c_shift_total(offset = @offset.date, rotation = @encryption_key.encryption_key)
		@offset.offset_c(offset) + @rotation.rotation_c(rotation)
		# @offset.offset_a("030315") + @rotation.rotation_a("123456")
	end

	def d_shift_total(offset = @offset.date, rotation = @encryption_key.encryption_key)
		@offset.offset_d(offset) + @rotation.rotation_d(rotation)
		# @offset.offset_a("030315") + @rotation.rotation_a("123456")
	end

end

# rot = Rotator.new
# puts rot.a_shift_total
