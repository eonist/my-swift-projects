class DictionaryModifier{
	/**
	 * Merges 2 dicts, changes the left array, the right is untouched
     * IMPORTANT: updateValue also creates new key,value pairs if non exist. 
     * TODO: ⚠️️ See legacy code, it has more powerfull dictionary modifiers
	 * Returns the left dictionary for convenience purposes
	 */
    static func merge<KeyType,ValueType> (_ left:inout [KeyType:ValueType], _ right: [KeyType:ValueType])-> [KeyType:ValueType]{
	    for (k,v) in right {left.updateValue(v,forKey:k)}
	    return left
	}
	/**
	 * Combines the key and property pairs of object PARAM: a and PARAM: b 
     * TODO: See legacy code, it has more powerfull dictionary modifiers
	 * NOTE: if key and property pairs have the same key the key from PARAM: b takes precedence
	 * NOTE: If the PARAM: a and PARAM: b both specify arrays, the elements of that array are concatenated // :TODO: test if they also merge?
	 * EXAMPLE:
     * var a:[String:Any] = ["name":"john", "color":"blue","index":0]
     * var b:[String:Any] = ["name":"john", "color":"red","index":2]
     * var c = DictionaryModifier.combine(a, b)
     * DictionaryParser.describe(c)//Output: key: color value: red, key: name value: john, key: index value: 2
	 */
    static func combine<K,V>(_ a:[K:V], _ b:[K:V])->[K:V]{//// :TODO: rename to combine since merge implies that the passed obj is also changed
		var c:[K:V] = [:]//use generics in the future: T and <T>
        for keyA in a.keys{c[keyA] = a[keyA]}//copies the items in a to the return object
        for keyB in b.keys{c[keyB] = b[keyB]}//assigns the items in b to the return object, if they already exist s they are overriden
		return c
	}
    /**
     * Converts tuples to dict
     */
    static func dict<K,V>(_ tuples:[(K,V)])->[K:V]{
        var dict:[K:V] = [K:V]()
        tuples.forEach {dict[$0.0] = $0.1}
        return dict
    }
}


//Also create an override method? see legacy code?
