import Foundation

class LineStyleParser {
    /**
     * NOTE: You could also add this as a Descrieable extension on the ILineStyle protocol but, its convenient enough to have it here. 
     */
    class func describe(lineStyle:ILineStyle){
        Swift.print("LineStyleParser.describe()")
        Swift.print("lineStyle: " + "\(lineStyle)")
        Swift.print("lineStyle.color.hex: " + "\(lineStyle.color.hexString)")
        Swift.print("lineStyle.color.alphaComponent: " + "\(lineStyle.color.alphaComponent)")
        Swift.print("lineStyle.thickness: " + "\(lineStyle.thickness)")
        Swift.print("lineStyle.lineCap: " + "\(lineStyle.lineCap)")
        Swift.print("lineStyle.lineJoin: " + "\(lineStyle.lineJoin)")
        Swift.print("lineStyle.miterLimit: " + "\(lineStyle.miterLimit)")
        Swift.print("lineStyle.phase: " + "\(lineStyle.phase)")
        Swift.print("lineStyle.lengths: " + "\(lineStyle.lengths)")
    }
    /**
     *
     */
    class func lineCapType(lineCap:CGLineCap)->String{
        if(lineCap == CGLineCap.Butt){return "butt"}
        else if(lineCap == CGLineCap.Round){return "round"}
        else{return "square"}//Square
    }
    /**
     * 
     */
    class func lineJoinType(lineJoin:CGLineJoin)->String{
        if(lineJoin == CGLineJoin.Miter){return "miter"}
        else if(lineJoin == CGLineJoin.Round){return "round"}
        else{return "bevel"}//Bevel
    }
    /**
     * Clones @param lineStyle
     */
    class func clone(lineStyle:ILineStyle) -> LineStyle {
        return LineStyle(lineStyle.thickness,lineStyle.color,lineStyle.lineCap,lineStyle.lineJoin,lineStyle.miterLimit,lineStyle.phase,lineStyle.lengths)
    }
}