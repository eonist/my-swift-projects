import Foundation
/**
 * SVGContainer serves as a Sprite but also has an id and an array that keeps track of the added items
 * // :TODO: could we omit the _items and just use the display-stack as a record of items added?
 * // :TODO: we need a remove method to compliment the add method
 */
class SVGContainer :ISVGContainer{
    var items : Array<ISVGElement> = [];
    var id : String = "";
}
