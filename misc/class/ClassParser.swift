class ClassParser {
    /**
    * Returns a usable class
    * NOTE: This works: (obj as! NSObject).className
    * Note: also works: String(obj)
    * NOTE: also works: classNameAsString(obj)
    * NOTE: This also works: print(NSStringFromClass(someInstance.dynamicType))
    * Example: let someObj : typeof(anotheraObj) = typeof(anotheraObj)(arguments here)//this creates an instance from the class of another instance
    */
    class func getClass(instance:Any!)->String{
        return _stdlib_getDemangledTypeName(instance).componentsSeparatedByString(".").last!//This call is subjected to change in future versions of swift
        //return typeOf(instance)
    }
    /**
     * Not tested
     * Note: there is a good example of this in LayoutUtils.swift
     * EXAMPLE: 
     * protocol ILayout{ init(_ a:String)}
     * class A:ILayout{required init(_ a:String)}
     * class B:ILayout{required init(_ a:String)}
     * var instance:ILayout
     * var classType:ILayout.Type
     * classType = A.self
     * instance = classType.init("abc")
     * classType = B.self
     * instance = classType.init("abc")
     */
   class func classType(instance:Any)->Any{
      return instance.dynamicType
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