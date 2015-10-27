class ClassParser {
    /**
    * Returns a usable class
    * NOTE: This works: (obj as! NSObject).className
    * Note: also works: String(obj)
    * NOTE: also works: classNameAsString(obj)
    * Example: let someObj : typeof(anotheraObj) = typeof(anotheraObj)(arguments here)//this creates an instance from the class of another instance
    */
    class func getClass(instance:Any!)->String{
        return _stdlib_getDemangledTypeName(instance).componentsSeparatedByString(".").last!//This call is subjected to change in future versions of swift
        //return typeOf(instance)
    }
}
/*
print("press")
print(String(obj))
print(classNameAsString(obj))
print("My class is \((obj as! NSObject).className)")


func classNameAsString(obj: Any) -> String {
print(String(obj))
return _stdlib_getDemangledTypeName(obj).componentsSeparatedByString(".").last!
}
*/