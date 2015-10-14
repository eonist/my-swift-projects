class NumberModifier{
    class func swapTwoDoubles(inout a:Double, inout _ b:Double) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
}