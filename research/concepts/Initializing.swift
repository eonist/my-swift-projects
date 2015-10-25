//Required Initializers

//Write the required modifier before the definition of a class initializer to indicate that every subclass of the class must implement that initializer:

class SomeClass {
    required init() {
        // initializer implementation goes here
    }
}

//You must also write the required modifier before every subclass implementation of a required initializer, to indicate that the initializer requirement applies to further subclasses in the chain. You do not write the override modifier when overriding a required designated initializer:

class SomeSubclass: SomeClass {
    required init() {
        // subclass implementation of the required initializer goes here
    }
}

//https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html
//convenience (can only refere to init methods within its own class)
//designated 
//Required Initializers - Write the required modifier before the definition of a class initializer to indicate that every subclass of the class must implement that initializer: