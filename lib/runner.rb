require_relative 'encryptor'
require_relative 'rotation_generator'
require_relative 'offset'
require_relative 'splitter'
require_relative 'encryption_key'

class Runner

  def initialize
    @rotation = RotationGenerator.new
    @offset = Offset.new
  end


 def encrypt(string)

    @rotation.generate_key      #Don't generate the key more than once, or everything will explode like a Michael Bay movie

    puts "Your key is: #{@rotation.key}"

    splitter    = Splitter.new(string)
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
      encrypted_arr.each { |block| new_str << block[i]}
      i += 1
    end

    print new_str.join

 end

  def decrypt(string, key, date)
    splitter = Splitter.new(string)
    splitter.split

    decrypt_rotation = RotationGenerator.new(key)

    a_encryptor = Encryptor.new(@offset.a + decrypt_rotation.a)
    a_new = a_encryptor.decrypt(splitter.a)

    b_encryptor = Encryptor.new(@offset.b(date) + decrypt_rotation.b)
    b_new = b_encryptor.decrypt(splitter.b)

    c_encryptor = Encryptor.new(@offset.c(date) + decrypt_rotation.c)
    c_new = c_encryptor.decrypt(splitter.c)

    d_encryptor = Encryptor.new(@offset.d(date) + decrypt_rotation.d)
    d_new = d_encryptor.decrypt(splitter.d)

    encrypted_arr = [a_new, b_new, c_new, d_new]

    new_str = []

    i = 0
    until a_new[i] == nil
      encrypted_arr.each { |block| new_str << block[i]}
      i += 1
    end

    print new_str.join


  end



end

test = Runner.new
test.encrypt("this is a test. asdf,.\n")
test.decrypt("hd,0yejf16kmgp2f1o7n07", "57281", "080315")
# test.decrypt("4qesb7hv77z49pos9bek9aeldq0oacss0p", "13444", "020315")
