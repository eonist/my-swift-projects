//more on protocol conformance: https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html#//apple_ref/doc/uid/TP40014097-CH25-ID283

//interfaces in swift are called protocols
//NOTE: https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html#//apple_ref/doc/uid/TP40014097-CH25-ID267
protocol Cleaner {
	// method signatures
	func cleanFloors()
	func vacuum()
	func emptyTrash() -> Bool//returns a boolean
	// properties
	var brokenBu1bs : Bool {get set}//its a getter and a setter
}
//NOTE: in xcode if you have protocols you can make the methods in the class by starting to write the method name and then hit enter and the entire method will auto complete
//NOTE: example of a protocol and class relationship:

//import UIKit
protocol ExampleProtocol {
	// method signatures
	func simpleMethod() -> Bool
	// properties
	var simpleProperty : Int { get }
}
class MyClass : ExampleProtocol {
	// provide anything else you need this class to do
	func simpleMethod() -> Bool {
		// do some work...
		return true
	}
	var simpleProperty : Int {
		return 59
	}
}


protocol Image {
    // Protocol defines only a properties'
    // type and whether it's gettable or settable
    var filename: String { get set }
    var filesize: Double { get }
    var mimetype: String { get }
    var height: Double { get }
    var width: Double { get }
    
    /*    class var someTypeProperty: Int { get set } */
    
    func save ()
    
    mutating func resize(width: Double, height: Double)
}

struct Gif : Image {
    var filename: String
    var filesize: Double
    var mimetype = "image/gif"
    var height: Double
    var width: Double
    
    func save() {
        
    }
    
    mutating func resize(width: Double, height: Double) {
        
    }
}

class Png : Image {
    var filename: String
    var filesize: Double
    var mimetype = "image/png"
    var height: Double
    var width: Double
    
    init(filename: String, filesize: Double, width: Double, height: Double) {
        self.filename = filename
        self.filesize = filesize
        self.width = width
        self.height = height
    }
    
    func save() {
        
    }
    
    // `mutating` is not required when the protocol already
    // declares it as such.
    func resize(width: Double, height: Double) {
        
    }
}

var gif = Gif(filename: "rainbow.gif", filesize: 2.3, mimetype: "image", height: 50, width: 50)
var png = Png(filename: "carry.png", filesize: 3.4, width: 100, height: 54)


func resizeImage (var img: Image) {
    img.resize(50.0, height: 50.0)
}


protocol Video {
    var framerate: Int { get }
    var resolution: Double { get }
}


struct Media: Image, Video {
    var filename: String
    var filesize: Double
    var mimetype: String
    var height: Double
    var width: Double
    var framerate: Int
    var resolution: Double
    
    func save() {
        
    }
    
    func resize(width: Double, height: Double) {
        
    }
}


func save(media: protocol<Image, Video>) {
    media.save()
}
