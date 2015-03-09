require_relative 'encryptor'
require_relative 'rotation_generator'
require_relative 'offset'
require_relative 'splitter'
require_relative 'encryption_key'

class Crack

  def initialize
    @key = "00000"
    @string = "4qesb7hv77z49pos9bek9aeldq0oacss0p"
    @date = "020315"
  end


  def crack
    splitter = Splitter.new(@string)
    splitter.split

    crack_offset = Offset.new(@date)

    new_str = []

    crack_rotation = RotationGenerator.new(@key)

    a_encryptor = Encryptor.new(crack_offset.a + crack_rotation.a)
    a_new = a_encryptor.decrypt(splitter.a)

    b_encryptor = Encryptor.new(crack_offset.b + crack_rotation.b)
    b_new = b_encryptor.decrypt(splitter.b)

    c_encryptor = Encryptor.new(crack_offset.c + crack_rotation.c)
    c_new = c_encryptor.decrypt(splitter.c)

    d_encryptor = Encryptor.new(crack_offset.d + crack_rotation.d)
    d_new = d_encryptor.decrypt(splitter.d)

    cracked_arr = [a_new, b_new, c_new, d_new]



    i = 0
    until a_new[i] == nil
      cracked_arr.each { |block| new_str << block[i]}
      i += 1
    end

    new_str.join

    if new_str[-7..-1] == "..end.."
      puts "The key is: #{@key}"
    else
      @key = @key.to_i
      @key += 1
      @key = @key.to_s
      crack
      # crack(string, date)
    end

  end

end

test = Crack.new
test.crack
