class IntModifier {
    /**
     * Directly replaces a with b, and b with a
     * NOTE: Modifies the original a and b Doubles
     */
    static func swap(_ a:inout Int, _ b:inout Int) {
        ObjectModifier.swapObjects(&a, &b)
    }
}
