require 'list'
require 'constants'

class ListBuilder
	def build(message)
		list = List.new
		list.items << ["decisionTable_0_0","make","decisionTable_0","ItShouldPrintFormattedName"]
		skip_colons = 1

		number_of_lists = message[skip_colons..Constants::MessageLenghtOffset].to_i
		for i in (0...number_of_lists)

			@lists << list
		end
		@lists = [list]
	end
	private
	def next_list_text(message,start,ending)
		message[start..ending]
	end
end
