animals = ['Cat','Dog','Iguana', nil]

animals.each do |animal|
	if(animal != nil) 
	puts "I have #{animal}"
	end
end