/*
Precedence and Associativity for Custom Infix Operators

Custom infix operators can also specify a precedence and an associativity. See Precedence and Associativity for an explanation of how these two characteristics affect an infix operator’s interaction with other infix operators.

The possible values for associativity are left, right, and none. Left-associative operators associate to the left if written next to other left-associative operators of the same precedence. Similarly, right-associative operators associate to the right if written next to other right-associative operators of the same precedence. Non-associative operators cannot be written next to other operators with the same precedence.

The associativity value defaults to none if it is not specified. The precedence value defaults to 100 if it is not specified.

The following example defines a new custom infix operator called +-, with left associativity and a precedence of 140:
*/
infix operator +- { associativity left precedence 140 }
func +- (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y - right.y)
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
// plusMinusVector is a Vector2D instance with values of (4.0, -2.0)
//This operator adds together the x values of two vectors, and subtracts the y value of the second vector from the first. Because it is in essence an “additive” operator, it has been given the same associativity and precedence values (left and 140) as default additive infix operators such as + and -. For a complete list of the default Swift operator precedence and associativity settings, see Expressions.