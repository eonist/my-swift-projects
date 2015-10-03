//if condition is met, the variable x only exists inside the if block
func fooBinding(x: Int?) {
    if let z = x where z > 0 {
        // Do stuff with x
        z.description
    }

    // Value requirements not met, do something
}

//if condition is met the variable x is also avilable outside the guard clause
func fooGuard(x: Int?) {
    guard let z = x where z > 0 else {
        // Value requirements not met, do something
        return
    }

    // Do stuff with x
    z.description
}

//an alternative:

func test(x:Int?){
	if x > 0{ 
		x.description
	}
	else return
}