class EncryptionKey
	attr_reader :key

  def initialize(key = encryption_key)
    @key = key
  end

  def encryption_key
    nums = []
    5.times {nums << rand(10)}
    nums.join
  end

end
