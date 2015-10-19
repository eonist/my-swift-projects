import Foundation


func test(){
    
    //replace chars in a string withouth regexp etc
    
    var aString = "Replace the letter e with *"
    
    var replacedString = ""
    
    for scalar in aString.unicodeScalars {
        let char = "\(scalar)"
        if char == "e" {
            replacedString = replacedString + "*"
        } else {
            replacedString = replacedString + char
        }
    }
    
    
}