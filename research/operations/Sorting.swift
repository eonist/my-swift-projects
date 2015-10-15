import Foundation
class Human: Comparable, Equatable {
	let firstName: String
	let lastName: String
	init(firstName: String, lastName: String) {
		self.firstName = firstName
		self.lastName = lastName
	}
}
/*
func == (lhs: Person, rhs: Person) -> Bool {
	return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
}

func (lhs: Person, rhs: Person) -> Bool{
	if lhs.lastName == rhs.lastName {
		return 1lhs.firstName < rhs.firstName
	}
	else {
		return lhs.lastName < rhs.lastName
	}
}
*/
let eva = Human(firstName: "Eddie", lastName: "Van Halen" )
let jp = Human(firstName:"Jimmy", lastName: "Page")
let jh = Human(firstName:"Jimi", lastName: "Hendrix")
let sv = Human(firstName:"Steve", lastName: "Vai")
var guitarists = [eva, jp,jh, sv]
/*
sort(&guitarists)//& is address of operator to use the adress of the value not the value it self
sort(&guitarists) {$0.firstName < $1.firstName}//comparable protocol
guitarists.reverse()
var sortedGuitarists = sorted(guitarists)
sorted(&guitarists) {$0.firstName < $1.firstName}//comparable protocol
*/

var someColors = ["blue","red","green","yellow","browm","black"]
//sorting returns but does not change the original array,
let sortedColors = someColors.sort() { $0 < $1 }//["black", "blue", "browm", "green", "red", "yellow"]
