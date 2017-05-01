function Card(rank, suit) {
  this.rank = rank;
  this.suit = suit;
}

Card.prototype.outputCard = function() {
  console.log(this.rank + " of " + this.suit);
}

var fourOfDiamonds = new Card(4, "diamonds");
fourOfDiamonds.outputCard();