import Foundation
/**
 * NOTE: If you write this in xcode: object_isClass and then cmd click it, you will find alot more methods like it
 */
class ClassAsserter{
    /**
     * Returns true if any of PARAM: instances is of class PARAM: classType
     */
    static func hasInstanceOfClassType<T>(_ instances:[Any?],_ classType:T.Type) -> Bool {
        return ClassParser.instanceByClassType(instances, classType) != nil
    }
    /**
     * EXAMPLE: Classes: print(ofType(a,A.self))//true or false
     * EXAMPLE: Protocols: print(ofType(a,IDescribable.self))//true or false
     */
    static func ofType<T>(_ instance:Any?,_ type:T.Type) -> Bool{/*<--we use the ? char so that it can also return a nil*/
        return instance as? T != nil
    }
	/**
	 * NOTE: You may try this aswell instance.isKindOfClass(classType)//seems not to work
     * NOTE: beware of isKindOfClass vs isMemberOfClass
     * NOTE: this works: layer.isKindOfClass(CALayer.self)//true /*Remeber that the instance must extend NSObject*/
     * CAUTION: doesnt work well with Double,String etc
     * IMPORTANT: doesnt work with protocols yet, do protocols as the example bellow:
     * EXAMPLE: 
     * protocol Decoratable{}
     * class A:Decoratable{}
     * class B:Decoratable{}
     * let object:AnyObject = A()
     * object.dynamicType is A.Type//true
     * object.dynamicType is B.Type//false
     * object.dynamicType is Decoratable.Type//true
	 */
    static func isOfClassType(_ obj:AnyObject,_ classType:AnyClass)->Bool{
        return obj.isMember!(of: classType)//swift 3 update, may not work
    }
    /**
     * Alternative to the above
     */
    static func isOfClassType2(_ obj:AnyObject, _ classType:AnyClass?, _ protocolType:AnyObject? = nil/**/)->Bool? {
        return object_getClass(obj) == classType!
    }
    /**
     * NOTE: this method supports checking if an instance is of the same ClassType as the other
     * NOTE: it also supports checking core classes like String and Double etc
     * NOTE: it also supports checking a class agains another
     * EXAMPLE: isOfSame("","")//true
     * EXAMPLE: isOfSame("".dynamicType,"".dynamicType)//true
     * EXAMPLE: isOfSame(SomeClass.self,SomeClass())//true
     * CAUTION: currently checking against protocols isnt supported
     */
    static func isOfSame(_ a: AnyObject, _ b: AnyObject) -> Bool {
        return object_getClassName(a) == object_getClassName(b)
    }
    /**
     * NOTE: you can also check if a class or instance is of a Protocol type: object.dynamicType is Decoratable.Type//true (this does not work if you add that line of text inside a method)
     * NOTE: protocol_conformsToProtocol(a,b) also exist
     * NOTE: // Works, but seems hackish as it reverts to string comparison NSStringFromProtocol(proto) == NSStringFromProtocol(Foo)
     * TODO: needs example, cant get this to work easily
     */
    static func isOfSameProtocol(_ a:Protocol,_ b:Protocol) -> Bool {
        return protocol_isEqual(a, b)
    }
    /**
     * Asserts if type is a class
     * EXAMPLE: 
     * class A{}
     * protocol I{}
     * ClassAsserter(A.self)//true
     * ClassAsserter(I.self)//false
     */
    static func isClass<T>(_ classType:T.Type)->Bool{
        return classType is AnyClass
    }
}
