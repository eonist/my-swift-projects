import Foundation

enum FlexBoxType{
    enum Justify:String{/*justify-content, applies to flexContainers*/
        case flexStart = "flexStart"/*Aligns from start to end*/
        case flexEnd = "flexEnd"/*Aligns from end to start*/
        case center = "center"/*Aligns one item after the other and centers their total position*/
        case spaceBetween = "spaceBetween"/*Aligns all items from the absolute start to absolute end and adds equa spacing between them*/
        case spaceAround = "spaceAround"/*Same as spaceBetween but does not pit to sides but rather add equal spacing there as well*/
    }
    /**
     * TODO: ⚠️️ Add AlignSelf, which works on flexItem 
     */
    enum AlignItems:String{/*align-items, applies to flexContainers*/
        case flexStart = "flexStart"
        case flexEnd = "flexEnd"
        case center = "center"
        //baseline /*Not implemented yet*/
        case stretch = "stretch"
    }
}
