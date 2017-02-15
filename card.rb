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
    # comment
  end

end

class Deck
  def initialize
    @deck = []
    rank = [:ace, 2,3,4,5,6,7,8,9,10,:jack, :queen, :king]
    suits = [:clubs, :hearts, :spades, :diamonds]
    
    suits.each do |suit|
      rank.each do |rank|
        @deck << Card.new(rank, suit)
      end
    end
    
  end

  def shuffle
    @deck.shuffle!
  end
  
  def deal
    top_card = @deck.shift
    puts "#{top_card.rank} of #{top_card.suit}"
  end
  

  def output
    @deck.each do |card|
      card.output_card
    end
  end
  
end

deck = Deck.new
# Check Deck build
# deck.output
deck.shuffle
# Check Deck shuffle
# deck.output
puts "Here is the hand you've been dealt:"
5.times do
  deck.deal
end