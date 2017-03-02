class Animal
  def eat
    puts "om nom nom"
  end
end

class Dog < Animal
  def bark
    puts "woof"
  end
end

class Cat < Animal
  def meow
    puts "meow"
  end
end

class Duck < Animal
  def quack
    puts "quack"
  end
end

class GoldenRetriever < Dog
  def fetch
    puts "running and getting it"
  end
end

animal = Animal.new
animal.eat

dog = Dog.new
dog.bark

cat = Cat.new
cat.eat
cat.meow

duck = Duck.new
duck.eat
duck.quack

gr = GoldenRetriever.new
gr.eat
gr.bark
gr.fetch