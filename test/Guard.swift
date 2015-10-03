//here the variable let only exists inside the if block
func fooBinding(x: Int?) {
    if let x = x where x > 0 {
        // Do stuff with x
        x.description
    }

    // Value requirements not met, do something
}

