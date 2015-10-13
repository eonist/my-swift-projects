
import Foundation

func testing(){
    let emptyString = String()
    print(emptyString)
    let anotherEmptyString:String = ""
    print(anotherEmptyString)
    let someStr:String = "abc 123"
    someStr.isEmpty //false
    someStr.hasPrefix("abc")//true
    someStr.hasSuffix("123")//true
    
    
    let anotherStr = "66"
    let someInt = Int(anotherStr)//66
    print(someInt)
    //the better solution would be to do:
    
    var thirdStr = "test"
    thirdStr += "abc"//concat the string
    
    //NOTE: you can concat a vhar and a string
    let theChar:Character = "a"
    let theChar2:Character = "b"// You must use the append method when working with characters (no longer the +- operator).
    var someString:String = ""
    someString.append(theChar)
    someString.append(theChar2)//yields a string containing "ab"
    
    //comparing strings
    "a" == "b"//false
    "a" != "b"//true
    //the bang operator:
    if("a" != "b"){
        "a" < "b"//true. a is lexically less than b, there is no greater than operator, use the bang operator for this support
    }//true)
    
        
    //NOTE: be aware of the limitations of methods suxh as the .componentsSeparatedByString, in that ot will return an nsimmutable string, which you can only read from, to get a string you can edit do the following:
    "/Users/alex/Desktop".componentsSeparatedByString("/")
    let mutable = NSMutableString(string: "He1lo")
    mutable.appendString(" There!")
    print(mutable)
    
    let letters: [Character] = ["c", "a", "f", "e"]
    let string: String = String(letters)
    
    print(letters.count) // 4
    print(string) // cafe
    print(string.characters.count) // 4
    //countElements("abc")//3//not working
    
    //looping:
    var theStr = "This is a string"
    for char in theStr.characters{
        print(char)
    }
    
    
}

