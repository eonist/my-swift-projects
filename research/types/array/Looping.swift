import Foundation

/**
*
*/
func testing(){
    let array = ["Apples", "Peaches", "Plums"]
    
    for (index, item) in array.reverse().enumerate() {
        print("Found \(item) at position \(index)")
    }
}
