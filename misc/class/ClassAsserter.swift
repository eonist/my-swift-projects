class ClassAsserter{
	/**
	 * 
	 */
	class func isOfClass(instance:AnyObject,_ theClass:AnyObject)->Bool{
		return instance is theClass
	}
}