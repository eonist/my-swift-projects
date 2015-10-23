//An object that conforms to NSCoding can be converted to an NSData object, and also be loaded from one, via the NSKeyedArchiver and NSKeyedUnarchiver classes. The trick to it is in the encodeWithCoder method, and in the special initializer: in the encodeWithCoder method, you take the NSCoder that’s passed in as a parameter, and store any values that you want to keep in it. Later, in the initializer, you pull those values out.”


//

let anObject = SerializableObject()

anObject.name = "My Thing That I'm Saving"

// Converting it to data
let objectConvertedToData =
    NSKeyedArchiver.archivedDataWithRootObject(anObject)

// Converting it back
// Note that the conversion might fail, so 'unarchiveObjectWithData' returns
// an optional value. So, use 'as?' to check to see if it worked.
let loadedObject = NSKeyedUnarchiver.unarchiveObjectWithData(objectConvertedToData)
        as? SerializableObject

loadedObject?.name
// = "My Thing That I'm Saving”
