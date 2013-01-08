animals = ['Cat','Dog','Iguana', nil]

person = {
	name: "Neung",
	email: "eakpun@gmail.com",
	colors: ["RED","GREEN","BLUE"]
}

animals.each do |animal|
	if(animal != nil) 
	puts "I have #{animal}"
	end
end