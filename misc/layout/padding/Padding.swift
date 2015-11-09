import Foundation
/*
* TopRightBottomLeft (TRBL aka Trouble)
*/
class Padding {
    var _top:Double = 0;
    var _right:Double = 0;
    var _bottom:Double = 0;
    var _left:Double = 0;
    init(array:Array<Double>) {
      switch(array.count){
         case 1: _left = array[0]; _right = array[0]; _top = array[0]; _bottom = array[0]; break;
         case 2: _top = array[0]; _bottom = array[0];_left = array[1]; _right = array[1]; break;
         case 3: _top = array[0]; _left = array[1]; _right = array[1]; _bottom = array[2];break;
         case 4: _top = array[0]; _right = array[1]; _bottom = array[2]; _left = array[3]; break;
      }
    }
}
