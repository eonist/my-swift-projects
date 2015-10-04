//Trailing Closures
//NOTE: //https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html#//apple_ref/doc/uid/TP40014097-CH11-ID94
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}
 
// here's how you call this function without using a trailing closure:
 
someFunctionThatTakesAClosure({
    // closure's body goes here
})
 
// here's how you call this function with a trailing closure instead:
 
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}


//auto clousures:
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// prints "5"
 
let customerProvider = { customersInLine.removeAtIndex(0) }
print(customersInLine.count)
// prints "5"
 
print("Now serving \(customerProvider())!")
// prints "Now serving Chris!"
print(customersInLine.count)
// prints "4"

//simolified:
// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serveCustomer(customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serveCustomer( { customersInLine.removeAtIndex(0) } )
// prints "Now serving Alex!"

//shorter version with autoclousures:
//customersInLine is ["Ewa", "Barry", "Daniella"]
func serveCustomer(@autoclosure customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serveCustomer(customersInLine.removeAtIndex(0))
// prints "Now serving Ewa!"
//NOTE Overusing autoclosures can make your code hard to understand. The context and function name should make it clear that evaluation is being deferred.
//The @autoclosure attribute implies the @noescape attribute, which indicates that the closure is used only within the function. That is, the closure isn’t allowed to be stored in a way that would let it “escape” the scope of the function and be executed after the function returns. If you want an autoclosure that is allowed to escape, use the @autoclosure(escaping) form of the attribute.