/**
 * TODO: the ILayout classes could probably be simplified with use of class generics 
 */
typealias ILayout = LayoutKind//legacy support
protocol LayoutKind{
    init(_ params:Self...)
}
