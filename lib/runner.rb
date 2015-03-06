require_relative 'encryption_key'      # => true
require_relative 'rotation_generator'  # => true
require_relative 'offset'              # => true

class Runner

  def initialize (offset = Offset.new, rotation = RotationGenerator.new)
    @offset = Offset.new
    @rotation = RotationGenerator.new
  end                                                                                             # => :initialize

  puts "Your Encryption Key is: #{@rotation.encryption_key}. Write that shit down!"  # ~> NoMethodError: undefined method `encryption_key' for nil:NilClass

  def encrypt


    # add offset to rotation, store as total shift_value
    # pass this shift value into
  end


	def a_shift_total   #(offset = @offset.date, rotation = @rotation)
		@offset.a + @rotation.rotation_a
	end

	def b_shift_total   #(offset = @offset.date, rotation = @rotation)
		@offset.b + @rotation.rotation_b
	end

	def c_shift_total   #(offset = @offset.date, rotation = @rotation)
		@offset.c + @rotation.rotation_c
	end

	def d_shift_total   #(offset = @offset.date, rotation = @rotation)
		@offset.d + @rotation.rotation_d
	end

end

test = Runner.new
print test.a_shift_total

# ~> NoMethodError
# ~> undefined method `encryption_key' for nil:NilClass
# ~>
# ~> /Users/ddaniel/turing/1module/4week/enigma/lib/runner.rb:12:in `<class:Runner>'
# ~> /Users/ddaniel/turing/1module/4week/enigma/lib/runner.rb:5:in `<main>'
