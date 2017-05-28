import Foundation

class FlexBoxAlignSelf{
    static func flexStart<T:Flexible>(_ item:T, _ container:CGRect){
        //for each, set item y to container y
    }
    /**
     *
     */
    static func flexEnd<T:Flexible>(_ item:T, _ container:CGRect){
        //for each item, set item y to alignPoint, bottom
    }
    /**
     *
     */
    static func center<T:Flexible>(_ item:T, _ container:CGRect){
        //for each item, set item y to alignPoint, center
    }
    /**
     *
     */
    static func stretch<T:Flexible>(_ item:T, _ container:CGRect){
        //for each, set item.y to container.y, set item.height to container.height
    }
}
