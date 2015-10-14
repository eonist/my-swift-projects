class NumberModifier{
    /*
     * Directly replaces a with b, and b with a
     * NOTE: Modifies the original a and b Doubles
     */
    class func swap(inout a:Double, inout _ b:Double) {
        ObjectModifier.swapObjects(&a, &b)
    }
}