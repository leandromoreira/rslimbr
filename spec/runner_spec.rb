#http://fitnesse.org/FitNesse.UserGuide.SliM.SlimProtocol.PortManagement
require '../lib/runner'

describe Runner do
	describe "default port" do
		it "should use the port 8085 if no command line argument was passed" do
		  runner = Runner.new(nil)
	    runner.port == 8085
		end
	end
end
