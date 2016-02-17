class DictionaryParser{
    /**
     * Describes properties in an object
     * // :TODO: maybe write a method that works on Class instances aswell? you probably could use that Class method that returns an xml of data about the object
     */
    class func describe(dictionary:Dictionary){
        //print("object is: " + typeof(dictionary) + ": " + dictionary);
        for(var val:* in dictionary) {
            trace(val + ' => ' + dictionary[val] + '   [' + typeof(dictionary[val]) + '] ');
            if(typeof(dictionary[val]) == "dictionary") describe(dictionary[val]);
        }
    }
}