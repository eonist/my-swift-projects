class ClassAsserter{
	/**
	 * NOTE: You may try this aswell instance.isKindOfClass(classType)
	 */
	class func isOfClass(instance:AnyObject,_ theClass:AnyObject)->Bool{
		return instance is theClass
	}
}