import Cocoa
/**
 * SVGContainer serves as a Sprite but also has an id and an array that keeps track of the added items
 * TODO: could we omit the _items and just use the display-stack as a record of items added?
 * TODO: we need a remove method to compliment the add method
 */
class SVGContainer:InteractiveView2, ISVGContainer{
    var id:String
    var items:[ISVGElement] = []
    init(_ items:[ISVGElement], _ id:String) {
        self.id = id;
        super.init(frame: NSRect(0,0,0,0))/*<--This can be a zero rect since the children contains the actual graphics. And when you use Layer-hosted views the subchildren doesnt clip*/
        /*
        self.wantsLayer = true/*if true then view is layer backed*/
        layer = CALayer()/*needs to be layer-hosted so that we dont get clipping of children*/
        layer!.masksToBounds = false//this is needed!!!
        */
        for item:ISVGElement in items {add(item)}
    }
    /**
     * PARAM: item (SVGGraphic and elements like SVGLinearGradient)
     */
    func add(_ element:ISVGElement) {
        if let element = element as? NSView {
            addSubview(element)
        }
        items.append(element)
    }
    /**
     * Asserts and returns an svg item by PARAM: id
     */
    func getItem(_ id:String)->ISVGElement?{
        return items.first(where: {$0.id == id})
    }
    required init(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
