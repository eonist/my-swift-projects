class RangeAsserter{
    /**
     * Asserts if @param a equals @param b
     */
    class func equals<T:Comparable>(a:Range<T>,_ b:Range<T>)->Bool {
        return a.start == b.start && a.end == b.end;
    }
    /**
     * Asserts if @param a contains @param a or @param b contains @param a
     */
    class func contains<T:Comparable>(a:Range<T>,b:Range<T>)->Bool {
        return a.start <= b.start && a.end >= b.end;
    }
}

