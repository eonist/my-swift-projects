import Foundation

class ReflectUtils {
    /**
     * Returns a dictionary for an instance
     * EXAMPLE: struct Data{var name:String = "John", male:Bool = true};dictionary(instance:Data())//{name:"John",male:"false"}
     */
    static func dictionary(instance:Any) -> [String:String] {
        let result:[(label:String,value:Any)] = Reflect.reflect(instance)
        return result.reduce([:]) {
            var dict:[String:String] = $0
            dict[$1.label] = "\($1.value)"
            return dict
        }
    }
    /**
     * New, can be used in conjunction with Generics, not in use yet
     */
//    static func dict(instance:Any) -> [String:Any] {
//        let result:[(label:String,value:Any)] = Reflect.reflect(instance)
//        return result.reduce([:]) {
//            var dict:[String:Any] = $0
//            dict[$1.label] = $1.value
//            return dict
//        }
//    }
}
