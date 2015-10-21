/**
 * Returns a usable class
 * NOTE: This works: (obj as! NSObject).className
 * Example: let someObj : typeof(anotheraObj) = typeof(anotheraObj)(arguments here)//this creates an instance from the class of another instance
 */
func getClass(instance:AnyObject!)->String{
	return _stdlib_getDemangledTypeName(instance).componentsSeparatedByString(".").last!//This call is subjected to change in future versions of swift
	//return typeOf(instance)
}
