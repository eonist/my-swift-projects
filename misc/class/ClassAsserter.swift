import Foundation
class ClassAsserter{
	/**
	 * NOTE: You may try this aswell instance.isKindOfClass(classType)//seems not to work
     * IMPORTANT: doesnt work with protocols yet, do protocols as the example bellow:
     * EXAMPLE: 
     * protocol Decoratable{}
     * class A:Decoratable{}
     * class B:Decoratable{}
     * let object:AnyObject = A()
     * object.dynamicType is A.Type//true
     * object.dynamicType is B.Type//false
     * object.dynamicType is Decoratable.Type//true
     * NOTE: beware of isKindOfClass vs isMemberOfClass
	 */
    class func isOfClassType(obj:AnyObject,_ classType:AnyClass)->Bool{
        return obj.isMemberOfClass(classType)
    }
}