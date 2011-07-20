#specs from http://fitnesse.org/FitNesse.UserGuide.SliM.SlimProtocol
require File.dirname(__FILE__) + '/../lib/list_builder'

describe ListBuilder do
	before (:each) do
			@builder = ListBuilder.new
			@plaintext_message = "[000009:000103:	[000004:000017:decisionTable_0_0:000004:make:000015:decisionTable_0:000026:ItShouldPrintFormattedName:]:000232:[000005:000017:decisionTable_0_1:000004:call:000015:decisionTable_0:000005:table:000142:[000002:000059:[000003:000004:name:000007:surname:000015:formatted name?:]:000058:[000003:000004:Matt:000008:Groening:000013:Matt Groening:]:]:]:000087:[000004:000017:decisionTable_0_2:000004:call:000015:decisionTable_0:000010:beginTable:]:000082:[000004:000017:decisionTable_0_3:000004:call:000015:decisionTable_0:000005:reset:]:000096:[000005:000017:decisionTable_0_4:000004:call:000015:decisionTable_0:000007:setName:000004:Matt:]:000103:[000005:000017:decisionTable_0_5:000004:call:000015:decisionTable_0:000010:setSurname:000008:Groening:]:000084:[000004:000017:decisionTable_0_6:000004:call:000015:decisionTable_0:000007:execute:]:000090:[000004:000017:decisionTable_0_7:000004:call:000015:decisionTable_0:000013:formattedName:]:000085:[000004:000017:decisionTable_0_8:000004:call:000015:decisionTable_0:000008:endTable:]:]"
	end
	describe "List builder" do
		it "The first list of commands should be [decisionTable_0_0,make,decisionTable_0,ItShouldPrintFormattedName]" do
			first_commands = ["decisionTable_0_0","make","decisionTable_0","ItShouldPrintFormattedName"]
			first_list = @builder.build(@plaintext_message)[0].items
			first_list.should == first_commands	 
		end
	end
end
