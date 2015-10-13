import Foundation
//NSRange does not support unicode like emojis etc
//Swift has ranges
func test(){
    let someText = "hello world"
    let range = someText.startIndex.advancedBy(3)..<someText.endIndex.advancedBy(-3)//create a range
    let result = someText.substringWithRange(range)
    print(result)//"lo wo"
}