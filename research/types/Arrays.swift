//array

/**
*
*/
func testing(){
    //the following two declarations are equivalent:
    
    var someArray: Array<String> = ["Alex", "Brian", "Dave"]
    let someArray2: [String] = ["Alex", "Brian", "Dave"]
    let someArray3: [String]//string array
    
    
    var someArray4:Array = [1,2,3]//mutable
    let stringArray = ["a","some","this"]//immutable
    var anotherArray:[String]
    anotherArray = ["abc","123"]
    print("your value: \(anotherArray[0])")//"abc"
    //adding items
    anotherArray.append("test")
    //plus equal mutating operator,concatinates 2 arrays,
    //non array items wont work
    //the items we concat are restricted by the same types that the oroginal array had
    anotherArray += ["test"]
    
    anotherArray.insert("hello",atIndex:2)
    //remove at index
    anotherArray.removeAtIndex(2)
    anotherArray.removeRange(1...2)
    anotherArray.removeAll()//clears out the array
    anotherArray.capacity//how much memory allocated to the array
    anotherArray.removeLast()
    //find array length
    anotherArray.count
    //.count = 0 can be written as:
    anotherArray.isEmpty//isRmpty is based on the count, not the capacity
    
    //
    for theItem in anotherArray{
        print("your value: \(theItem)")
    }
    //half closed range operator
    let tempArrayA = someArray[1..<3]//2,3
    //
    let tempArrayB = someArray[1...2]//2,3
    
    var intArray = [33,42,1,55,1,56,8,2]
    intArray.insert(4,atIndex:2)
    intArray[2] = 8//this replaces the item at index 2
    
    //extend
    intArray.removeAll(keepCapacity:true)
    intArray.capacity//3
    intArray.count//0
    intArray.appendContentsOf([4,5,6])//repopulate the array
    intArray.reserveCapacity(10)//adds more capacity
    
    //sorting
    …
    sortedCo1ors//has new order
    colors//remains the same order
    colors.sort() { $0 < $1 }//changes the original array
    colors//has new order
    //reversing the order
    someArray.reverse()//reversing the array,does not change the original array
    
    //filter
    let longCo1ors = colors.filter() { $0.lengthofBytesUsingEncoding(NSUTF8StringEncoding) > 3 }
    longColors //returns all colors longer than 3 letters                                                    I
    
    
    
    //map and reduce
    
    let colorLengths = co1ors.map() { $0.lengthofBytesUsingEncoding(NSUTFBStringEncoding) }
    colorLengths//num of chars in every color name as an aaray
    //slow mapreduce:
    var tota1Count = 0
    for length in colorLengths {
        totalCount += length
    }
    totalCount//num of chars of all items in array
    //fast map reduce:
    let totalLength = colorLengths.reduce(0) { $0 + $1 }
    totalLength//num of chars of all items in array
    
    
    //multi dim:
    //You can create multidimensional arrays by nesting pairs of square brackets, where the name of the base type of the elements is contained in the innermost pair of square brackets. For example, you can create a three-dimensional array of integers using three sets of square brackets:
    
    var array3D: [[[Int]]] = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]
}
