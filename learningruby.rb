animals = ['Cat','Dog','Iguana', nil]

person = {
	name: "Neung",
	email: "eakpun@gmail.com",
	colors: ["RED","GREEN","BLUE"]
}

animals.compact.each do |animal|
	puts "I have #{animal}"
end