// Sample inheritance in typescript.
/// <reference path="animal.ts" />
module Rescue {
  export class Dog extends Animal {
    constructor(name: string) {
      super(name);
    }

    sound() {
      return "My dog " + super.sound("bark!");
    }
  }
}

var colby = new Rescue.Dog("Colby");
alert(colby.sound())
