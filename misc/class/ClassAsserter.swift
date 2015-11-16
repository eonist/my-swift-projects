class ClassAsserter{
	/**
	 * NOTE: You may try this aswell instance.isKindOfClass(classType)//seems not to work
     * IMPORTANT: This isnt possible yet to do via a method call but see the example on how to do this in a regular way:
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
	class func isOfClass(instance:AnyObject,_ theClass:AnyClass)->Bool{
        //needs more research
		//return instance is theClass
        return false
	}
}