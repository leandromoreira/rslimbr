require 'list'

class ListBuilder
	def build(message)
		list = List.new
		list.items = ["decisionTable_0_0","make","decisionTable_0","ItShouldPrintFormattedName"]
		@lists = [list]
	end
end
