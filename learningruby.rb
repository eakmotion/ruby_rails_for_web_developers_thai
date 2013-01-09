animals = ['Cat','Dog','Iguana', nil]

person = {
	name: "Neung",
	email: "eakpun@gmail.com",
	colors: ["RED","GREEN","BLUE"]
}

class Animal 
	attr_accessor :name , :age , :gender
	def initialize(option={})
		self.name = option[:name] || "Snoopy"
		self.age = option[:age] || 1
		self.gender = option[:gender] || "male"
	end
end

class Mammal < Animal
	attr_accessor :legs , :baby_food , :special_ability
	def initialize(option={})
		super
		self.legs = option[:legs] || 4
		self.baby_food = option[:baby_food] || "milk"
		self.special_ability = option[:special_ability] || nil
	end

end

class Bird < Animal
	attr_accessor :wings
	def initialize(option={})
		super
		self.wings = option[:wings] || 2
		self.legs = option[:legs] || 2
	end
end

class Dog < Mammal
	attr_accessor :best_friend
	def initialize(option={})
		super
		self.best_friend = true
		self.special_ability = option[:special_ability] || "Friendly"
	end
end

class Cat < Mammal
	attr_accessor :claw_sharp
	def initialize(option={})
		super
		self.claw_sharp = true
		self.special_ability = option[:special_ability] || "climb up to the tree"
	end
end


animals.compact.each do |animal|
	puts "I have #{animal}"
end

golden_retriever = Dog.new #set golden retriver is Dog
golden_retriever.legs #call legs result (default = 4)
golden_retriever.best_friend #call golden retriver is best friend  
golden_retriever.special_ability #call golden retriver special ability


