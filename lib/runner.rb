require 'constants'
require 'socket'
require 'logging'
require 'slim_request'

class Runner
	include Logging
	attr_accessor :port
	def initialize(parameter)
		if parameter == nil 
			@port = Constants::DefaultPort
		else
			if parameter.to_s.include? "DSLIM_PORT"
				@port = parameter.split('=')[1].to_i
			else
				@port = parameter.to_i
				@port = (@port==0) ? Constants::DefaultPort : @port
			end
		end
		log "The port will be #{@port}"
	end
	
	def start
		log "SlimServer Listening..."
		server = TCPServer.open @port
    client = server.accept
		begin 		
			log "SlimServer connected with #{client}."
			client.puts Constants::SlimVersion
			log "SlimServer sent the version #{Constants::SlimVersion}"
			request_size = client.recv(Constants::MessageLenghtOffset)
			request = SlimRequest.new request_size			
			request.message = client.recv(request.size)
			log request.message
			it_is_not_bye_message = request.size != Constants::ByeMessageSize

			while it_is_not_a_bye_message do
				request = SlimRequest.new request_size
				request.message = client.recv request.size
				response = request.response
				client.puts response.message				
				request_size = client.recv(Constants::MessageLenghtOffset)
				it_is_not_bye_message = request.size != Constants::ByeMessageSize
			end
		rescue => e
			log e.message
			log e.backtrace
			client.puts "#{Constants::ExceptionMessage}<<#{e.message}>>#{e.backtrace}"
		ensure
			log "Closing client => #{client}"
			client.close
			log "Closed client => #{client}"
		end
	end
end
