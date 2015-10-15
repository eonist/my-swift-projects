import Foundation

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