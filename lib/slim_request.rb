require 'list'
require 'constants'

class SlimRequest
	attr_accessor :message, :instructions, :list
	def initialize(size)
		@size = size.to_i
		@list = List.new
	end
	def size
		@size
	end
	def response
	end
	def is_not_a_bye?
		#size != Constants::ByeMessageSize & @message.downcase != "bye"
		size != Constants::ByeMessageSize
	end
end
