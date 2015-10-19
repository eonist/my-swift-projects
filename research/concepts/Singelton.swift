/*
Singleton

Singletons provide a globally accessible, shared instance of an object. You can create your own singletons as a way to provide a unified access point to a resource or service that’s shared across an app, such as an audio channel to play sound effects or a network manager to make HTTP requests.

In Objective-C, you can ensure that only one instance of a singleton object is created by wrapping its initialization in a call the dispatch_once function, which executes a block once and only once for the lifetime of an app:
*/
/*
+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
 
    return _sharedInstance;
}
*/
//In Swift, you can simply use a static type property, which is guaranteed to be lazily initialized only once, even when accessed across multiple threads simultaneously:

class Singleton {
    static let sharedInstance = Singleton()
}
//If you need to perform additional setup beyond initialization, you can assign the result of the invocation of a closure to the global constant:

class Singleton {
    static let sharedInstance: Singleton = {
        let instance = Singleton()
        return instance// setup code
    }()
}
//For more information, see Type Properties in The Swift Programming Language (Swift 2.1).

//find more example of this class

class VehicleList {
  let vehicles: [String]
  static var sharedInstance = VehicleList()
  private init() {
    vehicles = []
  }
}