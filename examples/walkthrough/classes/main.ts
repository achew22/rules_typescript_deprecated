// Sample inheritance in typescript.
class Animal {
  constructor(public name: string) { }

  sound(sound: string) {
    return this.name + " goes " + sound;
  };
};

class Dog extends Animal {
  constructor(name: string) {
    super(name);
  }

  sound() {
    return "My dog " + super.sound("bark!");
  }
}

var colby = new Dog("Colby");
alert(colby.sound())
