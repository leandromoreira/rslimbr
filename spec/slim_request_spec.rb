#specs from http://fitnesse.org/FitNesse.UserGuide.SliM.SlimProtocol
require File.dirname(__FILE__) + '/../lib/slim_request'

describe SlimRequest do
	describe "Size of message" do
		it "should use 6 first chars to determine the size" do
			request_size = "002180"
		  request = SlimRequest.new request_size
			request.size.should == 2180
		end
	end
	describe "Message" do
		it "should contains the plaintext message" do
			request = SlimRequest.new "3"
			request.message = "abc"
			request.message.should == "abc"
		end
	end
end
