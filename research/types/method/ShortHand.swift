

//methods can be simplified:
//The following closure expressions are equivalent:

myFunction {
    (x: Int, y: Int) -> Int in
    return x + y
}


myFunction2 {
    (x, y) in
    return x + y
}


