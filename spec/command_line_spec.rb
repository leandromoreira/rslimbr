#http://fitnesse.org/FitNesse.UserGuide.SliM.SlimProtocol.PortManagement
require 'run'

describe Run, "#command line" do
	it "should use the port 8085 if no command line argument was passed" do
    command = Run.new
	end
end
