import Foundation

class LineStyleParser {
    /**
     * NOTE: You could also add this as a Descrieable extension on the ILineStyle protocol but, its convenient enough to have it here. 
     */
    static func describe(_ lineStyle:LineStylable){
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
     * CapType
     */
    static func lineCapType(_ lineCap:CGLineCap)->String{
        if(lineCap == CGLineCap.butt){return "butt"}
        else if(lineCap == CGLineCap.round){return "round"}
        else{return "square"}/*Square*/
    }
    /**
     * JoinType
     */
    static func lineJoinType(_ lineJoin:CGLineJoin)->String{
        if(lineJoin == CGLineJoin.miter){return "miter"}
        else if(lineJoin == CGLineJoin.round){return "round"}
        else{return "bevel"}/*Bevel*/
    }
    /**
     * Clones PARAM: lineStyle
     */
    static func clone(_ lineStyle:LineStylable) -> LineStyle {
        return LineStyle(lineStyle.thickness,lineStyle.color,lineStyle.lineCap,lineStyle.lineJoin,lineStyle.miterLimit,lineStyle.phase,lineStyle.lengths)
    }
}
