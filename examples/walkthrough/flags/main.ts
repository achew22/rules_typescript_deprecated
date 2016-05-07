// Sample inheritance in typescript.
import Animal from './animal'

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

let c = new Rescue.Dog("Colby");
c.sound();
