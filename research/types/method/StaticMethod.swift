/**
* public static constant methods and properties:
*/
class StringUtil{
    static var STRING_UTIL_NAME = "string util"//this is what is typically refered to as a public staic constant in other languages and is accessible from the class it self, not instances of it
    /**
    * Returns a list of text items by splitting a text at every delimiter
    */
    class func split(string:String, _ delimiter:String)->Array<String>{
        return string.componentsSeparatedByString(delimiter)
    }
    /**
     * NOTE: you cant access instance level variables when using public static constants
     */
    class func name()-> String{
        return STRING_UTIL_NAME
    }
}
func test(){
    print(StringUtil.name)////string util
    print(StringUtil.split("abc 123", " ")[0])//"123"
}
