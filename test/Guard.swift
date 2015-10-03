//if condition is met, the variable x only exists inside the if block
func fooBinding(x: Int?) {
    if let x = x where x > 0 {
        // Do stuff with x
        x.description
    }

    // Value requirements not met, do something
}

//if condition is met the variable x is also avilable outside the guard clause
func fooGuard(x: Int?) {
    guard let x = x where x > 0 else {
        // Value requirements not met, do something
        return
    }

    // Do stuff with x
    x.description
}

//an alternative:

func test(x:Int?){
	let x:Int = x > 0 ? return : x
}