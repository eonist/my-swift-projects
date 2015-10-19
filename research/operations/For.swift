//for loops:

/**
*
*/
func test(){
    let primeNumbers = [2, 3, 5, 7]
    
    for number in primeNumbers{//can also work with strings printing out single chars, like in applescript
        print("\(number)")
    }
    
    for var i = 0; i < 3; ++i{
        print(i)
    }
    
    //loop with range
    for index in 1...9 {//0...someVal will also work, or 0...<5 will do 0-4
        //do something with index
        print(index)
    }
    
    //reapeat 5 times:
    for _ in 0...5 {//avoids creating the i variable if your not going to use it, but need to repate something 5 times
        print("go")
    }
    
    //for loop with a break:
    //break statement exiting a for..in statement
    for count in 1...10 { //I supposed to loop 10 times
        if (count == 5) {
            break //I terminates Loop if count is 5
        }
        print("\(count)  ")
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
    
    /*
    let integers = [21,2,13,5,223]
    for (index, element) in enumerate(integers) {//enumerate returns tuple
        print(String(format:"%5d%7d", index, element))
    }
    */
    
    //Enumeration example: (this is good!!)
    
    let array = ["Apples", "Peaches", "Plums"]
    
    for (index, item) in array.enumerate() {
        print("Found \(item) at position \(index)")
    }
    
    
    //reverse
    var listOfNumbers = [1, 2, 3, 10, 100]

      for var i = listOfNumbers.count - 1; i >= 0; --i {
          println(listOfNumbers[i])
      }
}

