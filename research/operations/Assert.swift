/*
Debugging with Assertions

An assertion is a runtime check that a Boolean condition definitely evaluates to true. Literally put, an assertion “asserts” that a condition is true. You use an assertion to make sure that an essential condition is satisfied before executing any further code. If the condition evaluates to true, code execution continues as usual; if the condition evaluates to false, code execution ends, and your app is terminated.

If your code triggers an assertion while running in a debug environment, such as when you build and run an app in Xcode, you can see exactly where the invalid state occurred and query the state of your app at the time that the assertion was triggered. An assertion also lets you provide a suitable debug message as to the nature of the assert.

You write an assertion by calling the Swift standard library global assert(_:_file:line:) function. You pass this function an expression that evaluates to true or false and a message that should be displayed if the result of the condition is false:
*/
let age = -3
assert(age >= 0, "A person's age cannot be less than zero")
// this causes the assertion to trigger, because age is not >= 0
//In this example, code execution will continue only if age >= 0 evaluates to true, that is, if the value of age is non-negative. If the value of age is negative, as in the code above, then age >= 0 evaluates to false, and the assertion is triggered, terminating the application.

//The assertion message can be omitted if desired, as in the following example:

assert(age >= 0)
//NOTE Assertions are disabled when your code is compiled with optimizations, such as when building with an app target’s default Release configuration in Xcode.

/*
When to Use Assertions

Use an assertion whenever a condition has the potential to be false, but must definitely be true in order for your code to continue execution. Suitable scenarios for an assertion check include:

An integer subscript index is passed to a custom subscript implementation, but the subscript index value could be too low or too high.
A value is passed to a function, but an invalid value means that the function cannot fulfill its task.
An optional value is currently nil, but a non-nil value is essential for subsequent code to execute successfully.
See also Subscripts and Functions.

NOTE

Assertions cause your app to terminate and are not a substitute for designing your code in such a way that invalid conditions are unlikely to arise. Nonetheless, in situations where invalid conditions are possible, an assertion is an effective way to ensure that such conditions are highlighted and noticed during development, before your app is published.

*/