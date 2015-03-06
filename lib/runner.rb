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
    @rotation.generate_key      #Don't generate the key more than once, or everything will explode like a Michael Bay movie

    puts "Your key is: #{@rotation.key}"

    splitter = Splitter.new(string)
    splitter.split
    a_encryptor = Encryptor.new(@offset.a + @rotation.a)
    a_new = a_encryptor.encrypt(splitter.a)

    b_encryptor = Encryptor.new(@offset.b + @rotation.b)
    b_new = b_encryptor.encrypt(splitter.b)

    c_encryptor = Encryptor.new(@offset.c + @rotation.c)
    c_new = c_encryptor.encrypt(splitter.c)

    d_encryptor = Encryptor.new(@offset.d + @rotation.d)
    d_new = d_encryptor.encrypt(splitter.d)

    encrypted_arr = [a_new, b_new, c_new, d_new]

    new_str = []

    i = 0
    until a_new[i] == nil
      print a_new[i] + b_new[i] + c_new[i] + d_new[i] # ~> TypeError: no implicit conversion of nil into String
      i += 1
    end

  end

  def decrypt(string, key)

  end



end

test = Runner.new
test.encrypt("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")

# >> Your key is: 64571
# >> 8iu.8iu.8iu.8iu.8iu.8iu.8iu.8iu.8iu.8iu.8iu.8iu.8iu.8iu.8iu.

# ~> TypeError
# ~> no implicit conversion of nil into String
# ~>
# ~> /Users/ddaniel/turing/1module/4week/enigma/lib/runner.rb:41:in `+'
# ~> /Users/ddaniel/turing/1module/4week/enigma/lib/runner.rb:41:in `encrypt'
# ~> /Users/ddaniel/turing/1module/4week/enigma/lib/runner.rb:60:in `<main>'
