//optionals:http://makeapppie.com/2014/07/30/the-swift-swift-tutorial-ten-points-for-using-optionals/

//if conditions must be true or false, 0 or 1 does not work
//operators: <,>,==,!= 
//operators: AND, &&, OR,||
//multiple statmensts can be nested

if true { //parenthesies are optional in swift
	//do something
}else if false{
	//do something else
}



let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john.residence?.address = johnsAddress
 
if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}
// prints "John's street name is Laurel Street."

john.residence?.address?.buildingIdentifier()?.hasPrefix("The") 



//nil coalescing operator: ()

let currentColor: UIColor = view.backgroundColor ?? UIColor.whiteColor()
//If view.backgroundColor is not nil, it is used for the assignment, otherwise what comes to the right of ??

