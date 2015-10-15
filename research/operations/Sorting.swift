import Foundation

var someColors = ["blue","red","green","yellow","browm","black"]
//sorting returns but does not change the original array,
let sortedColors = someColors.sort() { $0 < $1 }//["black", "blue", "browm", "green", "red", "yellow"]


/**
*
*/
func test(){
    //If you have a custom struct or class and want to sort them arbitrarily, you should call sort() using a trailing closure that sorts on a field you specify. Here's an example using an array of custom structs that sorts on a particular property:
    struct MyCustomStruct {
        var someSortableField: String
    }
    
    let customArray = [
        MyCustomStruct(someSortableField: "Jemima"),
        MyCustomStruct(someSortableField: "Peter"),
        MyCustomStruct(someSortableField: "David"),
        MyCustomStruct(someSortableField: "Kelly"),
        MyCustomStruct(someSortableField: "Isabella")
    ]
    
    let sortedArray = customArray.sort { (element1, element2) -> Bool in
        return element1.someSortableField < element2.someSortableField
    }
    print(sortedArray)
    
}

/*

TODO: more research

class Human: Comparable, Equatable {
	let firstName: String
	let lastName: String
	init(firstName: String, lastName: String) {
		self.firstName = firstName
		self.lastName = lastName
	}
}
*/

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
/*

let eva = Human(firstName: "Eddie", lastName: "Van Halen" )
let jp = Human(firstName:"Jimmy", lastName: "Page")
let jh = Human(firstName:"Jimi", lastName: "Hendrix")
let sv = Human(firstName:"Steve", lastName: "Vai")
var guitarists = [eva, jp,jh, sv]

*/
/*
sort(&guitarists)//& is address of operator to use the adress of the value not the value it self
sort(&guitarists) {$0.firstName < $1.firstName}//comparable protocol
guitarists.reverse()
var sortedGuitarists = sorted(guitarists)
sorted(&guitarists) {$0.firstName < $1.firstName}//comparable protocol
*/
