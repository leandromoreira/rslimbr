#specs from http://fitnesse.org/FitNesse.UserGuide.SliM.SlimProtocol.PortManagement
require File.dirname(__FILE__) + '/../lib/runner'

describe Runner do
	describe "default port" do
		it "should use the port 8085 if no command line argument was passed" do
		  runner = Runner.new(nil)
			runner.port.should == 8085
		end
	end
	describe "a passed port" do
		it "should use the plain port passed on argument" do
			runner = Runner.new(1515)
			runner.port.should == 1515
		end
	end
	describe "a passed port by -DSLIM_PORT=xxxx" do
		it "should use the coded in parameter port on argument" do
			runner = Runner.new(" -DSLIM_PORT=2002 ")
			runner.port.should == 2002			
		end
	end
end
