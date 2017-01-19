class ObjectModifier {
    /**
     *
     */
    static func swapObjects<T>(_ a: inout T, _ b: inout T) {
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
