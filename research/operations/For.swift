//for loops:

for someItem in allItems{//can also work with strings printing out single chars, like in applescript
	//do something eith someItem
}

for var i = 0; i < 5;i++{

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



