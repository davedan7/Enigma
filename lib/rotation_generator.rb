

class RotationGenerator
	attr_reader :key

	def initialize(key = nil)
		@key = key           # => nil
	end             # => :initialize

	def generate_key
    nums = []                   # => []
    5.times {nums << rand(10)}  # => 5
    @key = nums.join            # => "51414"
  end                           # => :generate_key

	def rotation_a(key = @key)
		@key[0..1].to_i
	end                                   # => :rotation_a

	def rotation_b(key = @key)
		@key[1..2].to_i                      # => 14
	end                                   # => :rotation_b

	def rotation_c(key = @key)
		@key[2..3].to_i                      # => 41
	end                                   # => :rotation_c

	def rotation_d(key = @key)
		@key[3..4].to_i
	end                                   # => :rotation_d

end  # => :rotation_d

test = RotationGenerator.new
test.generate_key # => "51414"
puts test.key      # => nil
puts test.key      # => nil
puts test.rotation_b          # => nil
puts test.rotation_c          # => nil


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

# >> 51414
# >> 51414
# >> 14
# >> 41
