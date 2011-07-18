require 'logger'
module Logging
	@@logger = Logger.new File.dirname(__FILE__) + '/../rslimbr.log'  
	@@logger.level = Logger::DEBUG
	def log(message)
		@@logger.debug message
	end
end
