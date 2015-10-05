/**
 * returns a usable class
 * Example: let someObj : typeof(anotheraObj) = typeof(anotheraObj)(arguments here)//this creates an instance from the class of another instance
 */
func getClass(instance:AnyObject){
	return typeOf(instance)
}
