/**
 * NOTE: Swift has some of these methods built in but its nice to have them in one place, and also so that you can create other methods with similar DNA
 */
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

