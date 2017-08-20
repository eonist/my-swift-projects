import Cocoa
/**
 * SVGContainer serves as a Sprite but also has an id and an array that keeps track of the added items
 * TODO: ⚠️️ Could we omit the _items and just use the display-stack as a record of items added?
 * TODO: ⚠️️ We need a remove method to compliment the add method
 */
class SVGContainer:InteractiveView, SVGContainable{
    var id:String
    lazy var items:[SVGElementKind] = []
    init(_ items:[SVGElementKind], _ id:String) {
        self.id = id
        super.init(frame: NSRect.init(0,0,0,0))/*<--This can be a zero rect since the children contains the actual graphics. And when you use Layer-hosted views the subchildren doesnt clip*/
        items.forEach {add($0)}
    }
    /**
     * PARAM: item (SVGGraphic and elements like SVGLinearGradient)
     */
    func add(_ element:SVGElementKind) {
        items.append(element)
        guard let element = element as? NSView else {return}
        addSubview(element)
    }
    /**
     * Asserts and returns an svg item by PARAM: id
     */
    func getItem(_ id:String)->SVGElementKind?{
        return items.first(where: {$0.id == id})
    }
    required init(coder:NSCoder) {fatalError("init(coder:) has not been implemented")}
}
