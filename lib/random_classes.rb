class Encoder
	attr_reader :character_map

	def initialize
		@character_map = [*('a'..'z'), *('0'..'9'), " ", ".", ","]
	end
end


