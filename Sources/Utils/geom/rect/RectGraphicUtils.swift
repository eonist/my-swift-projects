import Foundation

class RectGraphicUtils {
    /**
     * NOTE: Only outside is different, Center and Inside are the same
     */
    static func fillFrame(_ rect:CGRect, _ lineThickness:CGFloat, _ offsetType:OffsetType)->CGRect{
        var fillFrameRect:CGRect = rect.copy()
        if(!lineThickness.isNaN && offsetType.left == OffsetType.outside){/*Left*/
            fillFrameRect = fillFrameRect.offset(lineThickness, 0)
        }
        if(!lineThickness.isNaN && offsetType.top == OffsetType.outside){/*Top*/
            fillFrameRect = fillFrameRect.offset(0,lineThickness)
        }
        return fillFrameRect
    }
    typealias LineOffset = (lineFrameRect:CGRect,lineRect:CGRect)
    /**
     * TODO: ⚠️️ move l,r,t,b into dedicated methods ? 
     */
    static func lineOffsetRect(_ rect:CGRect, _ lineThickness:CGFloat, _ offsetType:OffsetType)->LineOffset{
        var lineFrameRect:CGRect = rect.copy()
        var lineRect:CGRect = CGRect(0,0,rect.width,rect.height)
        /*Left*/
        if(offsetType.left == OffsetType.outside){
            lineFrameRect = lineFrameRect.expand(lineThickness, 0)
            lineRect = lineRect.offset(lineThickness / 2, 0)//.expand(-lineThickness/2, 0)
        }else if(offsetType.left == OffsetType.inside){ /*inside*/
            lineRect = lineRect.offset(-lineThickness/2, 0)//.expand(lineThickness/2 , 0)
        }else{//center
            lineFrameRect = lineFrameRect.offset(-lineThickness/2, 0).expand(lineThickness/2, 0)
            lineRect = lineRect.offset(lineThickness/2, 0)
        }
        /*Right*/
        if(offsetType.right == OffsetType.outside){
            lineFrameRect = lineFrameRect.expand(lineThickness, 0)
            lineRect = lineRect.expand(lineThickness, 0)
        }else if(offsetType.right == OffsetType.inside){/*inside*/
            lineRect = lineRect.expand(lineThickness, 0)
        }else{/*center*/
            lineFrameRect = lineFrameRect.expand(lineThickness/2, 0)
        }
        /*Top*/
        if(offsetType.top == OffsetType.outside){
            lineFrameRect = lineFrameRect.expand(0,lineThickness)
            lineRect = lineRect.offset(0, lineThickness/2)//.expand(0,-lineThickness/2)
        }else if(offsetType.top == OffsetType.inside){//inside
            lineRect = lineRect.offset(0, -lineThickness/2)//.expand(0,+lineThickness/2)
        }else{//center
            lineFrameRect = lineFrameRect.offset(0,-lineThickness/2).expand(0,lineThickness/2)
            lineRect = lineRect.offset(0,lineThickness/2)
        }
        /*Bottom*/
        if(offsetType.bottom == OffsetType.outside){/*outside*/
            lineFrameRect = lineFrameRect.expand(0,lineThickness)
            lineRect = lineRect.expand(0,lineThickness)
        }else if(offsetType.bottom == OffsetType.inside){/*inside*/
            lineRect = lineRect.expand(0,lineThickness)
        }else{//center
            lineFrameRect = lineFrameRect.expand(0,lineThickness/2)
        }
        return (lineFrameRect,lineRect)
    }
}
