require_relative 'encryptor'
require_relative 'encryption_key'
require_relative 'rotation_generator'
require_relative 'offset'
require_relative 'splitter'

class Runner

  def initialize
    @rotation = RotationGenerator.new
    @offset = Offset.new
  end


  def encrypt(string)
    rotation.generate_key

    print "Your key is: #{@rotation.key}"

    string_split = Splitter.new(string)
    a_encryptor = Encryptor.new(offset.a + rotation.a)
    a_encryptor.encrypt(string_split.split_a)


  end



end

test = Runner.new
print test.encrypt("Testing")  # => nil
