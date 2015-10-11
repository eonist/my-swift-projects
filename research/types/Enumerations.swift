class EnumTest{//enumerations:
	//enums are simple classes that can be used like this:
    enum Letters: Character {
        case a = "A"
        case b = "B"
        case c = "C"
    }
    func test(){
        var example = Example.A
        switch example {
        case .A:
            print("A")
        case .B:
            print("B")                               // B
        case .C:
            print("C")
        case .D:
            print("D")
        }
    }
	
}
enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
