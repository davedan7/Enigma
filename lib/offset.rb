class Offset

	# def initialize
	# 	@key
	# end

	def a(target_date = date) #on line 7 through 23, I created an argument that ddefaults to calling the date method so that I could stub the date for testing purposes
		key(target_date)[0].to_i
	end

	def b(target_date = date)
		key(target_date)[1].to_i
	end

	def c(target_date = date)
		key(target_date)[2].to_i
	end

	def d(target_date = date)
		key(target_date)[3].to_i
	end

	def key(target_date= date) # Takes the date from date method, passes it to digit_to_key_convert which produces the offset key
		digit_to_key_convert(target_date)
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