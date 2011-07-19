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
			request_size = client.recv(6)
			log request_size
			request_plain_message = client.recv(request_size.to_i+1)
		 	log request_plain_message
		rescue => e
			log e.message
			log e.backtrace
			client.puts "#{Constants::ExceptionMessage}<<#{e.message}>>#{e.backtrace}"
		ensure
			client.close
		end
	end
end
