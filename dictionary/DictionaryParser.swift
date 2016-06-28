class DictionaryParser{
    /**
     * Describes properties in an object
     * // :TODO: maybe write a method that works on Class instances aswell? you probably could use that Class method that returns an xml of data about the object
     */
    class func describe<T>(dictionary:Dictionary<T,T>){
        for (theKey,theValue) in dictionary{
            print("key: \(theKey) value: \(theValue)")
            //if(theValue is Dictionary) {describe(theValue)}
        }
    }
    /**
     *
     */
    class func values(){
        //var valuesArray = [Double](toppings.values)
    }
    /**
     *
     */
    class func keys(){
        //print(Array(theDict.keys))//convert the map collection view properties into an usable Array
    }
}