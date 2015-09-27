//combine,append,merge:

func += <KeyType, ValueType> (inout left: Dictionary<KeyType, ValueType>, right: Dictionary<KeyType, ValueType>) { 
    for (k, v) in right { 
        left.updateValue(v, forKey: k) 
    } 
}