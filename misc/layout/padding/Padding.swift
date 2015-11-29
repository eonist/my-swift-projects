import Foundation
/*
 * TopRightBottomLeft (TRBL aka Trouble)
 */
class Padding {//TODO: this is incomplete
    var top:Double = 0;
    var right:Double = 0;
    var bottom:Double = 0;
    var left:Double = 0;
    init(array:Array<Double>) {
      switch(array.count){
         case 1: left = array[0]; right = array[0]; top = array[0]; bottom = array[0]; break;
         case 2: top = array[0]; bottom = array[0];left = array[1]; right = array[1]; break;
         case 3: top = array[0]; left = array[1]; right = array[1]; bottom = array[2];break;
         case 4: top = array[0]; right = array[1]; bottom = array[2]; left = array[3]; break;
         default:break;
      }
    }
}