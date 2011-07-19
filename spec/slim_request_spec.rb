#specs from http://fitnesse.org/FitNesse.UserGuide.SliM.SlimProtocol
require File.dirname(__FILE__) + '/../lib/slim_request'

describe SlimRequest do
	describe "Size of message" do
		it "should use 6 first chars to determine the size" do
			request_size = "002180:"
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
		it "given the sample plaintext message should produce a list of 103 items" do
			plain_message = "[000009:000103:	[000004:000017:decisionTable_0_0:000004:make:000015:decisionTable_0:000026:ItShouldPrintFormattedName:]:000232:[000005:000017:decisionTable_0_1:000004:call:000015:decisionTable_0:000005:table:000142:[000002:000059:[000003:000004:name:000007:surname:000015:formatted name?:]:000058:[000003:000004:Matt:000008:Groening:000013:Matt Groening:]:]:]:000087:[000004:000017:decisionTable_0_2:000004:call:000015:decisionTable_0:000010:beginTable:]:000082:[000004:000017:decisionTable_0_3:000004:call:000015:decisionTable_0:000005:reset:]:000096:[000005:000017:decisionTable_0_4:000004:call:000015:decisionTable_0:000007:setName:000004:Matt:]:000103:[000005:000017:decisionTable_0_5:000004:call:000015:decisionTable_0:000010:setSurname:000008:Groening:]:000084:[000004:000017:decisionTable_0_6:000004:call:000015:decisionTable_0:000007:execute:]:000090:[000004:000017:decisionTable_0_7:000004:call:000015:decisionTable_0:000013:formattedName:]:000085:[000004:000017:decisionTable_0_8:000004:call:000015:decisionTable_0:000008:endTable:]:]"

		end
	end
end
