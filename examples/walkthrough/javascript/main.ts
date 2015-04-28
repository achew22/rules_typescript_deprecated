// Sample basic typescript code. Should be valid JS too.

var Animal = function(name) {
  this.name = name;
};

Animal.prototype.sound = function(sound) {
  return this.name + " goes " + sound;
};

var fish = new Animal("Fish");
console.log(fish.sound("blub"));
