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

//no protected in swift, use public and private

//https://developer.apple.com/swift/blog/?id=11

//a public getter and private settet:
public private(set) var numberOfEdits = 0

