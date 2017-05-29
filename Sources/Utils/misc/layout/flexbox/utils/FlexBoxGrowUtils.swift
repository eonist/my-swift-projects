import Foundation

class FlexBoxGrowUtils {
    /**
     * NOTE: has flex formulas: https://chriswrightdesign.com/experiments/flexbox-adventures/
     */
    static func grow(_ items:[FlexItem]){
        let occupiedSpace:CGFloat = items.reduce(0){
            $0 + $1
            //find all items that has grow set to 0 or 
        }
    }
}
//The way I understand it (Grow):
    //remainder space is key
    //grow means if there is 3 items and you want 1 to have 2 /3 of the space you set it to two and the other two to 0.5, f you set them to 1 then you get 4 sort of. THe grow should be the percentage IMO
    //shrink in conjunction with grow is hard
    //
