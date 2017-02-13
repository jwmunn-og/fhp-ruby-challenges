class Card
  attr_accessor :rank, :suit
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def output_card
    puts "#{self.rank} of #{self.suit}"
  end
  
  def self.random_card
    Card.new(rand(10), :spades)
  end

end

class Deck
  def initialize
    @cards = []
    suits = [:spades, :diamonds, :clubs, :hearts]
    rank = []
    # @cards << Card.new(10, :spades)
    # @cards << Card.new(:jack, :diamonds)
    # @cards << Card.new(3, :clubs)
    
    suits.each do |suit|
      # build array 1..10
      # push faces through once
    end
    
    #for each suit :spades, :diamonds, :clubs, :hearts
    #loop through 1..10, :jack, :queen, :king, :ace
    
  end

  def shuffle
    @cards.shuffle!
  end
  
  def deal
    top_card = @cards.shift
    puts "#{top_card.rank} of #{top_card.suit}"
  end
  

  # def output
  #   @cards.each do |card|
  #     card.output_card
  #   end
  # end
  
end

deck = Deck.new
deck.shuffle
deck.deal

# deck.output