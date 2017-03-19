import Foundation
typealias MatrixParser = CGAffineTransformParser/*Convenience*/
class CGAffineTransformParser {
    /**
     * Convenience, See MatrixModifier.transformWithPivot for more detail
     */
    static func transformWithPivot(_ transform:CGTransform, _ scale:CGPoint, _ rotation:CGFloat, _ offset:CGPoint, _ pivot:CGPoint,_ initRotation:CGFloat = 0) -> CGTransform {
        var transform = transform
        return MatrixModifier.transformWithPivot(&transform, scale, rotation, offset, pivot)
    }
    /**
     * Returns a matrix that you can get an objects position clockwise from the pivot, can also futher be manipulated if the input matrix has variables.
     * NOTE: The equivelent code in Matrix Trasform form: //let transform:CGAffineTransform = CGAffineTransformMake(cos(a),sin(a),-sin(a),cos(a),x - x * cos(a)+y * sin(a),y - x * sin(a) - y * cos(a))
     * TODO: we could return the matrix for method chaining
     * TODO: rename to just rotate? for simplicity?
     */
    static func rotateAroundPoint(_ transform:CGTransform,_ rotation:CGFloat,_ pivot:CGPoint)->CGTransform{
        var transform = transform
        transform.translate(pivot.x, pivot.y)/*<-this looks strage, but you sort of set the point here*/
        transform.rotate(rotation)// = CGAffineTransformRotate(transform, rotation);
        transform.translate(-pivot.x,-pivot.y)/*then you reset the offset to the original position*/
        return transform
    }
    /**
     * NOTE: You can chain scaleFromPoint and rotatAroundPoint and eventually skewFromPoint. This is a great way to get different transform results quickly
     */
    static func scaleFromPoint(_ transform:CGTransform, _ xScale:CGFloat,_ yScale:CGFloat,_ pivot:CGPoint)->CGTransform{
        var transform = transform
        transform.translate(pivot.x, pivot.y)/*<-this looks strange, but you sort of set the point here*/
        transform.scale(xScale,yScale)// = CGAffineTransformRotate(transform, rotation);
        transform.translate(-pivot.x,-pivot.y)/*then you reset the offset to the original position*/
        return transform
    }
    /**
     *
     */
    static func translate(_ transform:CGTransform,_ x:CGFloat,_ y:CGFloat)->CGTransform{
        var transform = transform
        transform.translate(x, y)
        return transform
    }
    /**
     * NOTE: this method is used in conjunction with the radial gradient matrix transformation of context
     * NOTE: the special thing about it is that the scale value follows the axis of the rotation. defualt rotation is 0 and thus scale.y becomes the width sort of
     */
    static func transformAroundPoint(_ transform:CGTransform, _ scale:CGPoint, _ rotation:CGFloat, _ offset:CGPoint, _ pivot:CGPoint)->CGTransform{
        var transform = transform
        transform = CGTransform.translate(transform,offset.x,offset.y)//transform,minRadius*gradient.relativeStartCenter!.x,minRadius*gradient.relativeStartCenter!.y
        transform = CGTransform.rotateAroundPoint(transform, rotation, pivot)
        transform = CGTransform.scaleFromPoint(transform, scale.y, scale.x, pivot)
        return transform
    }
    static func copy(_ transform:CGTransform)->CGTransform{
        return CGAffineTransform(transform.a, transform.b, transform.c, transform.d, transform.tx, transform.ty)//radialGradient.gradientTransform
    }
    static func concat(_ a:CGTransform,_ b:CGTransform)->CGTransform{
        return CGAffineTransformParser.concat(a, b)
    }
}