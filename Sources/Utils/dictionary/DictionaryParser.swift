class DictionaryParser{
    /**
     * Describes properties in an object
     * // :TODO: maybe write a method that works on Class instances aswell? you probably could use that Class method that returns an xml of data about the object
     */
    static func describe<K,V>(_ dictionary:Dictionary<K,V>) where K:CustomStringConvertible{
        for (theKey,theValue) in dictionary{
            print("key: \(theKey) value: \(theValue)")
            //if(theValue is Dictionary) {describe(theValue)}
        }
    }
    /**
     *
     */
    static func xml(dict:Dictionary<String,String>)->XML{
        let xml:XML = XML()
        for (theKey,theValue) in dict{
            print("key: \(theKey) value: \(theValue)")
            xml[theKey]
            //if(theValue is Dictionary) {describe(theValue)}
        }
        return XML()
        
    }
}
