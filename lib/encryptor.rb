

class Encryptor

  def initialize(shift, character_map = "abcdefghijklmnopqrstuvwxyz0123456789 .,")
    i = shift % character_map.size
    @encrypt_map = character_map[i..-1] + character_map[0..i]
    @decrypt_map = character_map
  end

  def encrypt(string)
    string.tr(@decrypt_map, @encrypt_map)
  end

  def decrypt(string)
    string.tr(@encrypt_map, @decrypt_map)
  end

end





  def split(input)
    input.chars.each_slice(4) {|block| @input_split << block}
  end

  def index_match

  end




# def character_map
#   [*('a'..'z'), *('0'..'9'), " ", ".", ","].join
# end
