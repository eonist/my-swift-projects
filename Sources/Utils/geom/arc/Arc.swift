import Foundation

class Arc:IArc{
    /**
     * NOTE: the largeFlag is always true if the span of the arc is more than 180Degrees or PI
     * NOTE: this version of the Arc class might be more precise when editing a path comprised of 1 or more arcs since you have control over the start and end point, like in a regular bezierpath, with the Arc4 you have less controll over the start and end,
     * NOTE: in XML the arc is defined as [startX,startY,xRadii,yRadii,rotation,largeArcFlag,sweepFlag,endX,endY,centerX,centerY]
     * TODO: ⚠️️ the reason Arc4 exists is because it can work with axises that are 0, if you want to Make Arc3 the primary arc class again you need to make sure it can also work with axis that are 0, the benefit of Ar3 is that its absolute precis while editing the arc instance start and end positions.
     * TODO: ⚠️️ a largeflag two that indicates wheter the start point is on the left or right side when one of the axises is 0 ould be a solution to the problem with 0 axises
     * TODO: ⚠️️ you might also want to consider including a position argument, for better performance and ease. this is just an idea
     */
    var start:CGPoint
    var xRadii:CGFloat// :TODO: i think the xRadii and yRadii can't be negative, confirm please and write it up as a note
    var yRadii:CGFloat
    var rotation:CGFloat
    var largeArcFlag:Bool/*if true the largest of two possible arcs are drawn*/
    var sweepFlag:Bool/*if true the arc is drawn clockwise, else its drawn counter clockwise*/
    var end:CGPoint
    var center:CGPoint?
    init(_ start:CGPoint,_ xRadii:CGFloat,_ yRadii:CGFloat,_ rotation:CGFloat,_ largeArcFlag:Bool, _ sweepFlag:Bool,_ end:CGPoint,_ center:CGPoint? = nil/*<-consider removing the null option*/) {
        self.start = start
        self.xRadii = xRadii
        self.yRadii = yRadii
        self.rotation = rotation
        self.largeArcFlag = largeArcFlag
        self.sweepFlag = sweepFlag
        self.end = end
        self.center = center
    }
}
