//advance usage of enum: http://appventure.me/2015/10/17/advanced-practical-enum-examples/

class EnumTest{//enumerations:
	//enums are simple classes that can be used like this:
	enum CarType{
		case Tractor
		case Sports
		case Sedan
		//or case Tractor, Sports,Sedan
	}
    func test(){
        var johnLikes:CarType
        johnLikes = CarType.Sedan
        johnLikes = .Sedan
        
        switch johnLikes{
            case .Sedan:
                print("he likes sedan")
            case .Sports:
                print("he likes sport cars")
            case .Tractor:
                print("he likes tractors")
            default:
                break;
        }
    }
	
}
enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

enum PlanetNumbers:Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

enum Letters: Character {
    case a = "A"
    case b = "B"
    case c = "C"
}

//When integers are used for raw values, they auto-increment if no value is specified.
enum Numbers: Int {
    case One = 1, Two, Three, Four, Five
}

var five = Numbers.Five
func testing(){
    print(five.rawValue)
    let possibleNum = Numbers(rawValue: 2)!
    print(possibleNum == Numbers.Two)       // true
}


//nested enums:
enum Character {
  enum Weapon {
    case Bow
    case Sword
    case Lance
    case Dagger
  }
  enum Helmet {
    case Wooden
    case Iron
    case Diamond
  }
  case Thief
  case Warrior
  case Knight
}
Now you have a hierachical system to describe the various items that your character has access to.

let character = Character.Thief
let weapon = Character.Weapon.Bow
let helmet = Character.Helmet.Iron

//enums in structs:
Containing Enums
In a similar vein, you can also embed enums in structs or classes. Continuing with our previous example:

struct Character {
   enum CharacterType {
    case Thief
    case Warrior
    case Knight
  }
  enum Weapon {
    case Bow
    case Sword
    case Lance
    case Dagger
  }
  let type: CharacterType
  let weapon: Weapon
}

let warrior = Character(type: .Warrior, weapon: .Sword)
This, again, helps in keeping related information together.