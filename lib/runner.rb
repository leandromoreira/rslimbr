require 'constants'
require 'socket'
require 'logging'

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
		start_server
	end
	
	private
	def start_server
		log "SlimServer Listening..."
		server = TCPServer.open @port
		loop {
  		Thread.start(server.accept) do |client|
				client.puts Constants::SlimVersion
				log "Sent to fitnesse the version #{Constants::SlimVersion}!"
  	  	log client.recv 100
				client.close
  		end
		}	
	end
end
