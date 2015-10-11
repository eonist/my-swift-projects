
/*
Literal Expression

A literal expression consists of either an ordinary literal (such as a string or a number), an array or dictionary literal, or one of the following special literals:

Literal
Type
Value

__FILE__
String
The name of the file in which it appears.
__LINE__
Int
The line number on which it appears.
__COLUMN__
Int
The column number in which it begins.
__FUNCTION__
String
The name of the declaration in which it appears.
Inside a function, the value of __FUNCTION__ is the name of that function, inside a method it is the name of that method, inside a property getter or setter it is the name of that property, inside special members like init or subscript it is the name of that keyword, and at the top level of a file it is the name of the current module.

*/

//When used as the default value of a function or method, the special literal’s value is determined when the default value expression is evaluated at the call site.

func logFunctionName(string: String = __FUNCTION__) {
    print(string)
}
func myFunction() {
    logFunctionName() // Prints "myFunction()".
}
 /*
myFunction()
namedArgs(1, withJay: 2)
*/