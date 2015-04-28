// Sample inheritance in typescript.
module Rescue {
  export class Animal {
    constructor(public name: string) { }

    sound(sound: string) {
      return this.name + " goes " + sound;
    }
  }
}
