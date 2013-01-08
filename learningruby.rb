animals = ['Cat','Dog','Iguana', nil]

person = {
	name: "Neung",
	email: "eakpun@gmail.com",
	colors: ["RED","GREEN","BLUE"]
}

class Animal 
	attr_accessor :name , :age , :gender
	def initialize
		@name = "Dog"
		@age = "3"
		@gender = "Male"
	end
end

class Mammal < Animal

	def initialize
		@legs = "4"
		@baby_food = "Milk"
		@special_ability = nil
	end

end

animals.compact.each do |animal|
	puts "I have #{animal}"
end