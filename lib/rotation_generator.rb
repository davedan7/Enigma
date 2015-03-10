require_relative 'encryption_key'

class RotationGenerator

	attr_accessor :key

	def initialize(key = nil)
		@key = key
	end

	def splits(key = @key)
		[key[0..1].to_i, key[1..2].to_i, key[2..3].to_i, key[3..4].to_i]
	end

end
