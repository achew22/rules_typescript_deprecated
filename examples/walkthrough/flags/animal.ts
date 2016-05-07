// Sample inheritance in typescript.
export default class {
  constructor(public name: string) { }

  sound(sound: string) {
    return this.name + " goes " + sound;
  }
}
