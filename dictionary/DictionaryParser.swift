class DictionaryParser{
    /**
     * Describes properties in an object
     * // :TODO: maybe write a method that works on Class instances aswell? you probably could use that Class method that returns an xml of data about the object
     */
    class func describe<T>(dictionary:Dictionary<T,T>){
        //print("object is: " + typeof(dictionary) + ": " + dictionary);
        /*
        for(var val:* in dictionary) {
        
        }
        */
        for (theKey,theValue) in dictionary{
            print("your value: \(theValue) and key: \(theKey)")
            
            print(val + ' => ' + dictionary[val] + '   [' + typeof(dictionary[val]) + '] ');
            if(typeof(dictionary[val]) == "dictionary") describe(dictionary[val]);
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