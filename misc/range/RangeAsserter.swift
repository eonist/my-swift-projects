class RangeAsserter{
    /**
     * Asserts if @param a equals @param b
     */
    class func equals(a:Range,b:Range)->Bool {
        return a.start == b.start && a.end == b.end;
    }
}