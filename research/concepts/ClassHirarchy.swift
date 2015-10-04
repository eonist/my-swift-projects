//here is agood idea: http://stackoverflow.com/questions/25828147/traverse-view-controller-hierarchy-in-swift


//You can use the postfix self expression to access a type as a value. For example, SomeClass.self returns SomeClass itself, not an instance of SomeClass. And SomeProtocol.self returns SomeProtocol itself, not an instance of a type that conforms to SomeProtocol at runtime. You can use a dynamicType expression with an instance of a type to access that instance’s dynamic, runtime type as a value, as the following example shows:
class SomeBaseClass {
    class func printClassName() {
        print("SomeBaseClass")
    }
}
class SomeSubClass: SomeBaseClass {
    override class func printClassName() {
        print("SomeSubClass")
    }
}
let someInstance: SomeBaseClass = SomeSubClass()
// The compile-time type of someInstance is SomeBaseClass,
// and the runtime type of someInstance is SomeBaseClass
someInstance.dynamicType.printClassName()
// prints "SomeSubClass"



//Use the identity operators (=== and !==) to test whether an instance’s runtime type is the same as its compile-time type.

if someInstance.dynamicType === someInstance.self {
    print("The dynamic type of someInstance is SomeBaseCass")
} else {
    print("The dynamic type of someInstance isn't SomeBaseClass")
}
// prints "The dynamic type of someInstance isn't SomeBaseClass"
//Use an initializer expression to construct an instance of a type from that type’s metatype value. For class instances, the initializer that’s called must be marked with the required keyword or the entire class marked with the final keyword.