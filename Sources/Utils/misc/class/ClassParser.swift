/**
 * NOTE: instance.className returns the class name of an instance like this:"NameOfApp.NameOfClass"
 * NOTE: if you use instance.dynamicType you get only the class name
 * NOTE: the bellow is from: class A{}
 * String(A.self.dynamicType)//A.Type
 * String(A.self)//A
 * String(A)//A
 */
class ClassParser {
    /**
     * NOTE: works with protocols and classes
     * EXAMPLE: Swift.print(ofType(a,A.self)!.text)//I am a
     * EXAMPLE: Swift.print(ofType(a,IDescribable.self)!.text)//I am a
     * EXAMPLE: Swift.print(ofType(b,B.self)!.text)//I am b
     * EXAMPLE: Swift.print(ofType(c,C.self))//instance of c
     */
    static func ofType<T>(_ instance:Any?,_ type:T.Type) -> T?{/*<--we use the ? char so that it can also return a nil*/
        return instance as? T
    }
    /**
     * Returns a usable class
     * NOTE: This works: (obj as! NSObject).className
     * NOTE: also works: String(obj)
     * NOTE: also works: classNameAsString(obj)
     * NOTE: This also works: print(NSStringFromClass(someInstance.dynamicType))
     * Example: let someObj : typeof(anotheraObj) = typeof(anotheraObj)(arguments here)//this creates an instance from the class of another instance
     */
    static func getClass(_ instance:Any!)->String{
        return String(describing:Swift.type(of: self)).components(separatedBy:".").last!//swift 3 update, could work!?!?
        //return _stdlib_getDemangledTypeName(instance).componentsSeparatedByString(".").last!//This call is subjected to change in future versions of swift
        //return typeOf(instance)
    }
    /**
     * Not tested
     * NOTE: there is a good example of this in LayoutUtils.swift
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
    static func type(_ instance:Any)->Any.Type{//was: -> any
        return Swift.type(of: instance)
    }
    /**
     * Untested
     */
    static func instanceByClassType<T>(_ instances:[Any?],_ classType:T.Type)->Any? {
        return instances.first(where: {$0 as? T != nil}) ?? nil
    }
    //DEPRECATED:
    static func classType(_ instance:Any)->Any.Type{return ClassParser.type(instance)}
}
extension ClassParser{
    static func stringType(_ instance:Any)->String{/*Convenience*/
        return String(describing: ClassParser.classType(instance))
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
