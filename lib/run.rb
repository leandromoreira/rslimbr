require 'slim_exception'
require 'runner'
require 'logging'

include Logging
 
raise SlimException.new("NO_PORT_WAS_CONFIGURED") unless ARGV.size > 0
log "-- run.br #{ARGV}"

server = Runner.new ARGV[0]
server.start
