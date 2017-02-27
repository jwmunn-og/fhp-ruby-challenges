class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
  
  def greet(yourName)
    "Hello #{yourName}, my name is #{self.name}"
  end
end

p joe = Person.new('Joe')
p joe.greet('Kate') # should return 'Hello Kate, my name is Joe'
p joe.name # should == 'Joe'