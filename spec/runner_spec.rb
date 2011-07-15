#http://fitnesse.org/FitNesse.UserGuide.SliM.SlimProtocol.PortManagement
require File.dirname(__FILE__) + '/../lib/runner'

describe Runner do
	describe "default port" do
		it "should use the port 8085 if no command line argument was passed" do
		  runner = Runner.new(nil)
	    runner.port == 8085
		end
	end
	describe "a passed port" do
		it "should use the port passed on argument" do
			runner = Runner.new(1515)
			runner.port == 1515
		end
	end
end
