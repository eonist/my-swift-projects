//guard is a great way to make a break in your methods


//if condition is met, the variable z only exists inside the if block
func fooBinding(x: Int?) {
    if let z = x where z > 0 {
        // Do stuff with x
        z.description
    }

    // Value requirements not met, do something
}

//if condition is met the variable z is also avilable outside the guard clause
func fooGuard(x: Int?) {
    guard let z = x where z > 0 else {
        // Value requirements not met, do something
        return
    }

    // Do stuff with x
    z.description
}

//an alternative: (now z is available outside the condition block aswell)

func test(x:Int?){
	let z:Int?
	if x > 0{ 
		z = x;
		z.description
	}
	else return
}