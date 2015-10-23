//Explains everything: https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/AccessControl.html#//apple_ref/doc/uid/TP40014097-CH41-ID3

//By default, every function and variable is internal — if you want to change that, you have to use the private or public keyword in front of every single method and variable:


/*
Basically:
private – accessible only from within the source file where it’s defined,
internal – accessible only from any file within the target where it’s defined
public – accessible from any file within the target where’s it’s defined, and from within any other context that imports the current target’s module.
*/

//syntax:
public class SomePublicClass {}
internal class SomeInternalClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
private func somePrivateFunction() {}

//no protected in swift, use public and private, or set the var as private and employ implicit public getters and setters, so that you dont inavertedly use a variable that you shouldnt have

//https://developer.apple.com/swift/blog/?id=11

//a public getter and private settet:
public private(set) var numberOfEdits = 0

/*
“Access Control
Swift defines three levels of access control, which determines what information is accessible to which parts of the application:
Public
Public classes, methods, and properties are accessible by any part of the app. For example, all of the classes in UIKit that you use to build iOS apps are public.
Internal
Internal data is only accessible to the module in which they’re defined. A module is an application, library, or framework. This is ”



“why you can’t access the inner workings of UIKit—it’s defined as internal to the UIKit framework. Internal is the default level of access control: if you don’t specify the access control level, it’s assumed to be internal.
Private
Private data is only accessible to the file in which it’s declared. This means that you can create classes that hide their inner workings from other classes in the same module, which helps to keep the amount of surface area that those classes expose to each other to a minimum.
The kind of access control that a method or property can have depends on the access level of the class that it’s contained in. You can’t make a method more accessible than the class in which it’s contained. For example, you can’t define a private class that has a public method:”


*/