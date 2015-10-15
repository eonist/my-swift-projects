import Foundation
/*

Swift loop types

for-statement
for-in-statement
while-statement
do-while-statement

*/
/**
* Reversing
*/
func testing(){
    let array = ["Apples", "Peaches", "Plums"]
    
    for (index, item) in array.reverse().enumerate() {
        print("Found \(item) at position \(index)")
    }
}

/**
 * Reversing
 */
func testing2(){
    let array = ["Apples", "Peaches", "Plums"]
    
    for item in array.reverse() {
        print("Found \(item)")
    }
}