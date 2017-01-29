class ObjectModifier {
    /**
     * Use native swap()
     */
    static func swapObjects<T>(_ a: inout T, _ b: inout T) {
        swap(&a, &b)
    }
}
