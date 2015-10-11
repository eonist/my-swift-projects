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