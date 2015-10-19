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
    
    
    //split a string withouth regexp etc: 
    
    var problem = "split this string into words and print them on separate lines"
    
    var word = ""
    
    for scalar in problem.unicodeScalars {
        if scalar == " " {
            print(word)
            word = ""
        } else {
            word += "\(scalar)"
        }
    }
    
    // don't forget the last word
    print(word)
    
    // split
    // this
    // string
    // into
    // words
    // and
    // print
    // them
    // on
    // separate
    // lines

}
/**
 *
 */
func testing(){
    //find the longst word:
    var problem = "find the longest word in the problem description"
    
    // this will help the algorithm see the last word
    problem += " "
    
    var word = ""
    var length = 0
    
    var max = 0
    var longestWord = ""
    
    for scalar in problem.unicodeScalars {
        if scalar == " " {
            if length > max {
                max = length
                longestWord = word
            }
            word = ""
            length = 0
        } else {
            word += "\(scalar)"
            length++
        }
    }
    
    print(longestWord)
}