class Beer
  attr_accessor :type
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def cheers
    puts "Hooray Beer!"
  end
end

class Brewery < Beer
  attr_accessor :company
  def initialize(company, type)
    @company = company
    @type = Beer.new(type)
  end

  def company
    @company
  end

  def type
    @type.type
  end

end

red_ale = Beer.new("Red Ale")
sockeye = Brewery.new("Midnight Brewing Co.", "India Pale Ale")

puts "Thats a yummy #{redAle.type}."
red_ale.cheers
puts "#{sockeye.company} has a tasty #{sockeye.type}."
sockeye.cheers