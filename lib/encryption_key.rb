class EncryptionKey
	attr_reader :encryption_key

  def encryption_key
    nums = []
    5.times {nums << rand(10)}
    nums.join
  end

end
