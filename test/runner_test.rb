require './lib/runner'
require_relative 'test_helper'

class RunnerTest < Minitest::Test

	def setup
		@run = Runner.new
	end

  def test_it_can_encrypt_a_letter
    a = Runner.new
		a.key = EncryptionKey.new("12345")
    assert_equal a.encrypt("a", "080315"), "v"
  end




end
