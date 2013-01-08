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
	attr_accessor :legs , :baby_food , :special_ability
	def initialize
		super
		@legs = "4"
		@baby_food = "Milk"
		@special_ability = nil
	end

end

class Bird < Animal
	attr_accessor :wings , :legs
	def initialize
		super
		@wings = "2"
		@legs = "2"
	end
end


animals.compact.each do |animal|
	puts "I have #{animal}"
end