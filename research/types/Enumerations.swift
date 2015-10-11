class EnumTest{//enumerations:
	//enums are simple classes that can be used like this:
	enum CarType{
		case Tractor
		case Sports
		case Sedan
		//or case Tractor, Sports,Sedan
	}
	
	var johnLikes:CarType
	johnLikes = CarType.Sedan
	johnLikes = .Sedan
	
	switch johnLikes{
		case .Sedan
			printin("he likes sedan")
		case .Sports
			printin("he likes sport cars")
		case .Tractor
			printin("he likes tractors")
		default
			break;
	}
}
enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
