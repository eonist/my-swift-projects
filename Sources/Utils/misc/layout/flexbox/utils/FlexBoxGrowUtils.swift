import Foundation

class FlexBoxGrowUtils {
    /**
     * NOTE: has flex formulas: https://chriswrightdesign.com/experiments/flexbox-adventures/
     */
    static func grow(_ items:[FlexItem],_ container:CGRect){
        let occupiedSpace:CGFloat = items.lazy.filter{ $0.grow == 0 }.reduce(0){$0 + $1}/*finds all items that has grow set to 0*/
        let remainder:CGFloat = container - occupiedSpace
        let totGrow
    }
}
//The way I understand it (Grow):
    //remainder space is key
    //grow means if there is 3 items and you want 1 to have 2 /3 of the space you set it to two and the other two to 0.5, f you set them to 1 then you get 4 sort of. THe grow should be the percentage IMO
    //shrink in conjunction with grow is hard
    //
