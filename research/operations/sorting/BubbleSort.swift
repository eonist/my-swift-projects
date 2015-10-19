func test(){
	var listOfNumbers = [1, 2, 3, 10, 100]

	var nElements = listOfNumbers.count

	var didSwap = true

	while didSwap {
	    didSwap = false

	    for i in 0..<nElements - 1 {
	        if listOfNumbers[i] < listOfNumbers[i+1] {
	            var tmp = listOfNumbers[i]
	            listOfNumbers[i] = listOfNumbers[i+1]
	            listOfNumbers[i+1] = tmp
	            didSwap = true
	        }
	    }
	} 
}