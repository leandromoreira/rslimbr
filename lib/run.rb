require 'runner'
require 'logging'

include Logging
log "-- run.br #{ARGV}"

server = Runner.new ARGV[0]
server.start
