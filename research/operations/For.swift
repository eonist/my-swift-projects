//for loops:


let primeNumbers = [2, 3, 5, 7]

for number in primeNumbers{//can also work with strings printing out single chars, like in applescript
    println("\(number)")
}




for var i = 0; i < 3; ++i{
    print(i)
}

//loop with range
for index in 1...9 {//0...someVal will also work, or 0...<5 will do 0-4
    //do something with index
    print(index)
}

//for loop with a break:
//break statement exiting a for..in statement
for count in 1...10 { //I supposed to loop 10 times
    if (count == 5) {
        break //I terminates Loop if count is 5
    }
    print("\(Count)  ")
}

//for loop with continue:
//continue statement exiting a for...in statement
for count in 1...10 { // supposed to loop 10 times
    if (count == 5) {
        continue // move to next iteration of the loop
    }
    print("\(count)  ")
}
// for...in loop with enumerate global function
for (index, element) in enumerate(integers) {//enumerate returns tuple
    println(String(format:"%5d%7d", index, element))
}
