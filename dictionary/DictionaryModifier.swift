class DictionaryModifier{
	/**
	 * Merges 2 arrays, changes the left array, the right is untouched
	 * Returns the left dictionary for convenience purposes
	 */
	static func merge<KeyType,ValueType> (inout left:Dictionary<KeyType,ValueType>, _ right: Dictionary<KeyType,ValueType>)-> Dictionary<KeyType,ValueType>{
	    for (k,v) in right {left.updateValue(v,forKey:k)}
	    return left
	}
	/**
	 * Combines the key and property pairs of object PARAM: a and PARAM: b 
	 * NOTE: if key and property pairs have the same key the key from PARAM: b takes precedence
	 * NOTE: If the PARAM: a and PARAM: b both specify arrays, the elements of that array are concatenated // :TODO: test if they also merge?
	 * EXAMPLE:
	 * var a:Object = {name:"john", color:"blue",index:0};
	 * var b:Object = {name:"john", color:"red",index:2};
	 * var c:Object = ObjectModifier.merge(a, b);
	 * ObjectDescriber.describe2(c)//Output:    [number] index => 2, [string] color => red, [string] name => john
	 */
	static func combine<K,V>(a:Dictionary<K,V>, _ b:Dictionary<K,V>)->Dictionary<K,V>{//// :TODO: rename to combine since merge implies that the passed obj is also changed
		var c:Dictionary<K,V> = [:]//use generics in the future: T and <T>
        for keyA in a.keys{c[keyA] = a[keyA]}//copies the items in a to the return object
        for keyB in b.keys{c[keyB] = b[keyB]}//assigns the items in b to the return object, if they already exist s they are overriden
		return c
	}
}