class ClassAsserter{
	/**
	 * 
	 */
	func isOfClass(instance:AnyObject,theClass:AnyObject)->Bool{
		return instance is theClass
	}
}