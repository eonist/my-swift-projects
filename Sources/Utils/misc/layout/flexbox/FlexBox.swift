import Foundation
//FlexContainer
//flexItem
class FlexBox {

}
enum FlexBoxType:String{
    case flexStart = "flexStart"/*Aligns from start to end*/
    case flexEnd = "flexEnd"/*Aligns from end to start*/
    case center = "center"/*Aligns one item after the other and centers their total position*/
    case spacebetween = "spaceBetween"/*Aligns all items from the absolute start to absolute end and adds equa spacing between them*/
    case spaceAround = "spaceAround"/*Same as spaceBetween but does not pit to sides but rather add equal spacing there as well*/
}
