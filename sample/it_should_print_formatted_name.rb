class ItShouldPrintFormattedName
	attr_accessor :name, :surname

	def formatted_name
		"#{@name} #{@surname}"
	end
end
