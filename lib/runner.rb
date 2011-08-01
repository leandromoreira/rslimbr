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
	end
	
	def start
		client = listening_client
		begin 		
			request = start_connection_with(client)
			while request.is_not_a_bye? do
				request = SlimRequest.new request_size
				request.message = client.recv request.size
				client.puts slim.process request
				request_size = client.recv(Constants::MessageLenghtOffset)
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


	private
	def listening_client
		log "SlimServer Listening..."
		server = TCPServer.open @port
    server.accept
	end
	def start_connection_with(client)
		log "SlimServer connected with #{client}."
		client.puts Constants::SlimVersion
		log "SlimServer sent the version #{Constants::SlimVersion}"
		request_size = client.recv(Constants::MessageLenghtOffset)
		request = SlimRequest.new request_size			
		request.message = client.recv(request.size)
		log "SlimServer request => #{request.message}"
		request
	end
end
