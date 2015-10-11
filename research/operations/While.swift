var someOptionalInt: Int?

repeat{
    println("Trying to get an integer")
    someOptionalInt = functionThatMayReturnAnInteger()
    //change condition
    //always executed once
    
} while (someOptionalInt != nil)

println("Got a nil instead")


while i < 5{
    println("\(i)")
    i++
    //change condition
}