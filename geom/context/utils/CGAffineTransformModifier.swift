import Foundation

class CGAffineTransformModifier {
    /**
     * NOTE: The result may vary if you change the order of how the translations are applied. This method does not work if you need to rotate and scale around a point for instance, then you need to change the order
     * NOTE: its prefreable to chain the methods bellow. so if yoou need other variations of this method. You may want to just chain some transform calls instead
     */
    class func transformWithPivot(inout transform:CGAffineTransform, _ scale:CGPoint, _ rotation:CGFloat, _ offset:CGPoint, _ pivot:CGPoint,_ initRotation:CGFloat = 0) {
        transform = CGAffineTransformTranslate(transform, pivot.x, pivot.y)/*<-this looks strage, but you sort of set the point here*/
        if(initRotation != 0) {transform.rotate( -initRotation)}
        transform.scale(scale.x, scale.y);
        transform.rotate(rotation);
        transform.translate(-pivot.x+offset.x, -pivot.y+offset.y);/*globalToLocal*/
    }
}
