require 'constants'

class SlimRequest
	attr_accessor :message, :instructions, :list
	def initialize(size)
		@size = size.to_i
	end
	def size
		@size
	end
	def is_not_a_bye?
		#size != Constants::ByeMessageSize & @message.downcase != "bye"
		size != Constants::ByeMessageSize
	end
end
