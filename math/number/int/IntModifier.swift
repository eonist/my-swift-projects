class IntModifier {
    /**
     * Directly replaces a with b, and b with a
     * NOTE: Modifies the original a and b Doubles
     */
    class func swap(inout a:Int, inout _ b:Int) {
        ObjectModifier.swapObjects(&a, &b)
    }
}