#specs from http://fitnesse.org/FitNesse.UserGuide.SliM.SlimProtocol.PortManagement
require File.dirname(__FILE__) + '/../lib/runner'

describe Runner do
	describe "Default port" do
		it "should use the port 8085 when no command line is pass" do
		  runner = Runner.new(nil)
			runner.port.should == 8085
		end
	end
	describe "Plain port by argument" do
		it "should use the plain port" do
			runner = Runner.new(1515)
			runner.port.should == 1515
		end
	end
	describe "Coded port by argument -DSLIM_PORT=xxxx" do
		it "should use the value of DSLIM_PORT" do
			runner = Runner.new(" -DSLIM_PORT=2002 ")
			runner.port.should == 2002			
		end
	end
	describe "Undefined parameter to runner" do
		it "should use the default port 8085" do
			runner = Runner.new(" m@lform3D ")
			runner.port.should == 8085			
		end
	end
end
