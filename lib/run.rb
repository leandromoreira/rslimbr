require 'slim_exception'
require 'runner'

raise SlimException.new("NO_PORT_WAS_CONFIGURED") unless ARGV.size > 0
Runner.new ARGV[0]
