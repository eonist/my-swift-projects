/**
 * TODO: the ILayout classes could probably be simplified with use of class generics 
 */
typealias ILayout = LayoutKind
protocol LayoutKind{
    init(_ params:Any...)
}
