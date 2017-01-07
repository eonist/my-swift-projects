class ObjectModifier {
    /**
     *
     */
    static func swapObjects<T>(inout a: T, inout _ b: T) {
        /*
        let temporaryA = a
        a = b
        b = temporaryA
        */
        var a:String = ""
        var b:String = ""
        swap(&a, &b)
    }
}