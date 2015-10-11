//Unlike if, guard creates the variable that can be accessed from outside its block. It is useful to unwrap a lot of Optionals.
//guard is greate for parsing data
//guard is a great way to make a exit in your methods
guard let someVal = anotherVal where anotherVal > 0 else {return}//if anither val isnt over 0 then exit method
guard let someVal = anotherVal.item? else {return}//if item doesnt exist then exit your method(works with optional chaining aswell)

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
    guard let z = x where z > 0 else {//<- here is a great example of how we can use guard for the else part of an if clause
        // Value requirements not met, do something
        return
    }

    // Do stuff with x
    z.description
}

//an alternative: (now z is available outside the condition block aswell) this looks more logical than guard. but guard can be handy in complex if else setups

func test(x:Int?){
	let z:Int?
	if x > 0{ 
		z = x;
		z.description
	}
    else {return}
}


//parsing example using guard:
func parseJSONWithGuard(data : [String : AnyObject]) throws -> Developer {

    guard let firstname = data["First"] as? String  else {
        return Developer() // we could return a nil Developer()
    }

    guard let lastname = data["Last"] as? String else {
        throw ParseError.BadName // or we could throw a custom exception and handle the error
    }

    guard let website = data["WebSite"] as? String else {
        throw ParseError.BadName
    }

    guard let iosDev = data["iosDeveloper"] as? Bool else {
        throw ParseError.BadName
    }



    return Developer(first: firstname, last: lastname, site: website, ios: iosDev)

}