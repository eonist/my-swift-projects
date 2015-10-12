

//methods can be simplified:
//The following closure expressions are equivalent:
/*
//XCODE crashes on these
myFunction {
    (x: Int, y: Int) -> Int in
    return x + y
}
*/
/*

//XCODE crashes on these
myFunction2 {
    (x, y) in
    return x + y
}


*/


/*
//XCODE crashes on these
myFunction3 { return $0 + $1 }

*/