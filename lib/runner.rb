require './lib/encryption_key'
require './lib/rotation_generator'
require './lib/offset_generator'

class Runner

  def initialize
    @encryption_key = EncryptionKey.new
    @offset = OffsetGenerator.new
    rotation = RotationGenerator.new(@encryption_key)
  end

  def encrypt

  end

end
