import Cocoa

class LineStyle {
    var color:NSColor
    var borderWidth:Int
    /**
    *
    */
    init(borderWidth:Int = 0,color:NSColor = NSColor.clearColor()){
        self.borderWidth = borderWidth
        self.color = color
    }
}

//add borderWidth


/*

private var _color:Number;
private var _alpha:Number;
public function FillStyle(color:Number = NaN, alpha:Number = 1) {
_color = color;
_alpha = !isNaN(alpha) ? alpha:1;/*if alpha is NaN then assign 1*/
}
public function get alpha():Number {
return _alpha;
}
public function get color():Number {
return _color;
}
public function set color(color:Number):void{
_color = color;
}
public function set alpha(alpha:Number):void{
_alpha = alpha;
}

*/