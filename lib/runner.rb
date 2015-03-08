require_relative 'encryptor'
require_relative 'rotation_generator'
require_relative 'offset'
require_relative 'splitter'
require_relative 'encryption_key'

class Runner

  attr_accessor :key

  def initialize
    # @rotation = RotationGenerator.new
    @offset = Offset.new
    @key = EncryptionKey.new

  end


 def encrypt(string, date = @offset.date)

    # @rotation.generate_key      #Don't generate the key more than once, or everything will explode like a Michael Bay movie
    rotation = RotationGenerator.new(@key.key)
    offset = Offset.new(date)

    puts "Your key is: #{rotation.key}, and the date is #{date}"

    splitter = Splitter.new(string)
    splitter.split

    a_encryptor = Encryptor.new(offset.a + rotation.a)
    a_new = a_encryptor.encrypt(splitter.a)

    b_encryptor = Encryptor.new(offset.b + rotation.b)
    b_new = b_encryptor.encrypt(splitter.b)

    c_encryptor = Encryptor.new(offset.c + rotation.c)
    c_new = c_encryptor.encrypt(splitter.c)

    d_encryptor = Encryptor.new(offset.d + rotation.d)
    d_new = d_encryptor.encrypt(splitter.d)

    encrypted_arr = [a_new, b_new, c_new, d_new]

    new_str = []

    i = 0
    until a_new[i] == nil
      encrypted_arr.each { |block| new_str << block[i]}
      i += 1
    end

    new_str.join

 end

  def decrypt(string, key, date)
    splitter = Splitter.new(string)
    splitter.split

    decrypt_offset = Offset.new(date)
    decrypt_rotation = RotationGenerator.new(key)

    a_encryptor = Encryptor.new(decrypt_offset.a + decrypt_rotation.a)
    a_new = a_encryptor.decrypt(splitter.a)

    b_encryptor = Encryptor.new(decrypt_offset.b + decrypt_rotation.b)
    b_new = b_encryptor.decrypt(splitter.b)

    c_encryptor = Encryptor.new(decrypt_offset.c + decrypt_rotation.c)
    c_new = c_encryptor.decrypt(splitter.c)

    d_encryptor = Encryptor.new(decrypt_offset.d + decrypt_rotation.d)
    d_new = d_encryptor.decrypt(splitter.d)

    encrypted_arr = [a_new, b_new, c_new, d_new]

    new_str = []

    i = 0
    until a_new[i] == nil
      encrypted_arr.each { |block| new_str << block[i]}
      i += 1
    end

    new_str.join


  end



end

# test = Runner.new
# test.key = EncryptionKey.new("12345")
#
# print test.encrypt("a", "010101\n")
# print test.encrypt("a", "080315\n")
# print test.encrypt("a\n")
# test.encrypt("this is a test. asdf,.\n")
# test.decrypt("bzb s0lpvpmwa.4pv 9xuq", "51691", "080315")
# test.decrypt("hd,0yejf16kmgp2f1o7n07", "57281", "080315")
# print test.decrypt("4qesb7hv77z49pos9bek9aeldq0oacss0p", "13444", "020315")
