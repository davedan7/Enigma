class OffsetGenerator
	attr_accessor :date

	def initialize(target_date = date)
		@target_date = target_date
	end

	def splits
		[key[0].to_i, key[1].to_i, key[2].to_i, key[3].to_i]
	end

	def key(date = @target ) # Takes the date from date method, passes it to digit_to_key_convert which produces the offset key
		digit_to_key_convert(@target_date)
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
