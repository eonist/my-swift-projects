#if os(iOS)
import UIKit
/**
 * Aligning relative to another view (x,y)
 * TODO: ⚠️️ The examples in this class is a bit outdated and needs an update ⚠️️
 * NOTE: Has a lot of NSConstraint and NSAnchor info: https://stackoverflow.com/a/26181982/5389500
 * Discussion: anchor is a more appropriate name than, pin,pos,pt,edge,put,magnet,align,corner (anchor can represent both corner,edge and center)
 * EXAMPLE: square.translatesAutoresizingMaskIntoConstraints = false (this enables you to set your own constraints)
 * EXAMPLE: contentView.layoutMargins = UIEdgeInsetsMake(12,12,12,12)//adds margin to the containing view
 * EXAMPLE: let pos = Constraint.pos(square,to:canvas,targetAlign:.topleft,toAlign:.topleft)
 * EXAMPLE: let size = Constraint.size(square,to:canvas)
 * EXAMPLE: NSLayoutConstraint.activate([anchor.x,anchor.y,size.w,size.h]) 
 */
class Constraint{
    /**
     * Creates a positional constraint
     */
    static func anchor(_ view:UIView,to:UIView,align:Alignment,alignTo:Alignment,offset:CGPoint = CGPoint(), useMargin:Bool = false) -> (x:NSLayoutConstraint,y:NSLayoutConstraint) {/*,offset:CGPoint = CGPoint()*/
        let horConstraint = Constraint.anchor(view, to: to, align: align.horAlign, alignTo: alignTo.horAlign,offset:offset.x,useMargin:useMargin)
        let verConstraint = Constraint.anchor(view, to: to, align: align.verAlign, alignTo: alignTo.verAlign,offset:offset.y,useMargin:useMargin)
        return (horConstraint,verConstraint)
    }
    /**
     * creates a dimensional constraint
     * EXAMPLE: let widthConstraint = Constraint.size(square,to:canvas,axis:.horizontal).w
     */
    static func size(_ target:UIView,to:UIView) -> (w:NSLayoutConstraint,h:NSLayoutConstraint){
        let widthConstraint = Constraint.width(target,to:to)
        let heightConstraint = Constraint.height(target,to:to)
        return (widthConstraint,heightConstraint)
    }
}
//size
extension Constraint{
    /**
     * EXAMPLE: let sizeConstraint = Constraint.dim(square,size:CGSize(100,100))
     */
    static func size(_ view:UIView, size:CGSize, multiplier:CGSize = CGSize(width:1,height:1)) -> (w:NSLayoutConstraint,h:NSLayoutConstraint){
        let widthConstraint = Constraint.width(view, width: size.width, multiplier: multiplier.width)
        let heightConstraint = Constraint.height(view, height: size.height, multiplier: multiplier.height)
        return (widthConstraint,heightConstraint)
    }
    /**
     * New
     */
    static func width(_ view:UIView,width:CGFloat,multiplier:CGFloat = 1) -> NSLayoutConstraint{
        return NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: multiplier, constant: width)//NSLayoutAttribute
    }
    /**
     * New
     */
    static func height(_ view:UIView,height:CGFloat,multiplier:CGFloat = 1) -> NSLayoutConstraint{
        return NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: multiplier, constant: height)//NSLayoutAttribute
    }
    /**
     * Creates a size constraint
     * EXAMPLE: let widthConstraint = Constraint.dim(square,to:canvas,axis:.horizontal)
     */
    static func width(_ view:UIView,to:UIView,offset:CGFloat = 0,multiplier:CGFloat = 1) -> NSLayoutConstraint{
        return NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: to, attribute: .width, multiplier: multiplier, constant: offset)//NSLayoutAttribute.notAnAttribute
    }
    /**
     * New
     */
    static func height(_ view:UIView,to:UIView,offset:CGFloat = 0,multiplier:CGFloat = 1) -> NSLayoutConstraint{
        return NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: to, attribute: .height, multiplier: multiplier, constant: offset)//NSLayoutAttribute.notAnAttribute
    }
    /**
     * New
     * NOTE: Useful if you want to set a width of an object to the height of another object
     */
    static func length(_ view:UIView,to:UIView,viewAxis:Axis,toAxis:Axis,offset:CGFloat = 0,multiplier:CGFloat = 1) -> NSLayoutConstraint{
        let viewAttr:NSLayoutAttribute = viewAxis == .horizontal ? .width : .height
        let toAttr:NSLayoutAttribute = toAxis == .horizontal ? .width : .height
        return NSLayoutConstraint(item: view, attribute: viewAttr, relatedBy: .equal, toItem: to, attribute: toAttr, multiplier: multiplier, constant: offset)//NSLayoutAttribute.notAnAttribute
    }
}
//anchor
extension Constraint{
    //x hor
    static func anchor(_ view:UIView, to:UIView, align:HorizontalAlign, alignTo:HorizontalAlign, offset:CGFloat = 0, useMargin:Bool = false) -> NSLayoutConstraint {/*,offset:CGPoint = CGPoint()*/
        return NSLayoutConstraint(item: view, attribute: Constraint.layoutAttr(align), relatedBy: .equal, toItem: to, attribute: Constraint.layoutAttr(alignTo,useMargin:useMargin), multiplier: 1.0, constant: offset)
    }
    //y ver
    static func anchor(_ view:UIView, to:UIView, align:VerticalAlign, alignTo:VerticalAlign, offset:CGFloat = 0, useMargin:Bool = false) -> NSLayoutConstraint {/*,offset:CGPoint = CGPoint()*/
        return NSLayoutConstraint(item: view, attribute: Constraint.layoutAttr(align), relatedBy: .equal, toItem: to, attribute: Constraint.layoutAttr(alignTo,useMargin:useMargin), multiplier: 1.0, constant: offset)
    }
}
//layoutAttri (internal)
extension Constraint{
    //x
    private static func layoutAttr(_ align:HorizontalAlign,useMargin:Bool = false) -> NSLayoutAttribute{
        switch align{
        case .left: return useMargin ? NSLayoutAttribute.leftMargin : NSLayoutAttribute.left //fatalError("err")
        case .right: return useMargin ? NSLayoutAttribute.rightMargin : NSLayoutAttribute.right
        case .centerX: return useMargin ? NSLayoutAttribute.centerXWithinMargins : NSLayoutAttribute.centerX
        }
    }
    //y
    private static func layoutAttr(_ align:VerticalAlign,useMargin:Bool = false) -> NSLayoutAttribute{
        switch align{
        case .top: return useMargin ? NSLayoutAttribute.topMargin : NSLayoutAttribute.top
        case .bottom: return useMargin ? NSLayoutAttribute.bottomMargin : NSLayoutAttribute.bottom
        case .centerY: return useMargin ? NSLayoutAttribute.centerYWithinMargins : NSLayoutAttribute.centerY
        }
    }
}
#endif
