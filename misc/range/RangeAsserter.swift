class RangeAsserter{
    /**
     * Asserts if @param a equals @param b
     */
    class func equals<T:Comparable>(a:Range<T>,b:Range<T>)->Bool {
        return a.startIndex == b.startIndex && a.endIndex == b.endIndex;
    }
}

