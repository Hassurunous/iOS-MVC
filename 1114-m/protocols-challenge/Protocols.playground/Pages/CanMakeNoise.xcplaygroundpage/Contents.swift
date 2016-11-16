//: Playground - noun: a place where people can play

import UIKit

protocol CanMakeNoise {
  func makeNoise() -> String
}

class Human: CanMakeNoise {
    func makeNoise() -> String {
        return("#HumanNoises")
    }
}

class Pig: CanMakeNoise {
    func makeNoise() -> String {
        return("#Oink")
    }
}

class Cow: CanMakeNoise {
    func makeNoise() -> String {
        return("#Moo")
    }
}

let human = Human()
let pig = Pig()
let cow = Cow()

let arrayOfNoiseMaker: [CanMakeNoise] = [human, pig, cow]

for noisemaker in arrayOfNoiseMaker {
    print(noisemaker.makeNoise())
}

/*:
 **Tasks**:
 1. Uncomment above line and make the code compile. This can be achieved by implementing the `CanMakeNoise` protocol in all the classes. Think about a noise each class could make and print it to the console using `print`.
 2. Iterate over `arrayOfNoiseMaker` and let each object make their noise
 */

