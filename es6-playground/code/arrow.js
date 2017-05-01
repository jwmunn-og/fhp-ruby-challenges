"use strict";

class Hello {
  constructor() {
    this.num = 2;
  }

  addTwo() {
    const addIt = () => {
      // arrow function locks the value of `this`
      this.num = this.num + 2;
    }
    addIt();
  }
}

const h = new Hello();
h.addTwo();
console.log(h.num);