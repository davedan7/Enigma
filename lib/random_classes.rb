class Encoder
	attr_reader :character_map

	def initialize
		@character_map = [*('a'..'z'), *('0'..'9'), " ", ".", ","]
	end
end


class OffsetGenerator
	# Took the date key generator out of here, so have to instantiate
end

class DateKeyGen  #Took this out of OffsetGenerator. Takes the current date and produces an offset key


	def key # Takes the date from date method, passes it to digit_to_key_convert which produces the offset key
		digit_to_key_convert(date)
	end
	
	def date
		time = Time.now
		time.strftime("%d%m%y")
	end

	def digit_to_key_convert(input) # Four digit code that comes from squaring the date
		nums = input.to_i
		nums *= nums	
		nums.to_s[-4..-1]
	end
	
end

class RotationGenerator
end

