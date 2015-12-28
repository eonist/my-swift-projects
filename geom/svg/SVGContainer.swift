import Cocoa
/**
 * SVGContainer serves as a Sprite but also has an id and an array that keeps track of the added items
 * // :TODO: could we omit the _items and just use the display-stack as a record of items added?
 * // :TODO: we need a remove method to compliment the add method
 */
class SVGContainer : NSView, ISVGContainer{
    var id : String
    var items : Array<ISVGElement> = [];
    init(_ items:Array<ISVGElement>, _ id:String) {
        self.id = id;
        super.init(frame: NSRect(0,0,0,0))//<--This can be a zero rect since the children contains the actul graphics. And when you use Layer-hosted views the subchildren doesnt clip
        for item : ISVGElement in items { add(item) }
        
    }
    
    /**
     * @param item (SVGGraphic and elements like SVGLinearGradient)
     */
    func add(element:ISVGElement) {
        if(element is NSView) { addSubview(element as! NSView) }
        items.append(element);
    }
    
    /**
     * Asserts and returns an svg item by @param id
     */
    func getItem(id:String)->ISVGElement?{
        for item : ISVGElement in items{ if(item.id/*["id"]*/ == id) {return item}}; return nil;
    }
    
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
