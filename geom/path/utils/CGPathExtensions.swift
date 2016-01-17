import Foundation

extension CGMutablePath{
    /**
     * Note its probably better to move this method into the Graphic class since then it can be overriden by subclasses, which you cant do with this extension method, really?
     */
    func add(path:CGPath){
        CGPathAddPath(self, nil, path)
    }
    /**
     * Returns a copy of it self
     */
    func copy()->CGMutablePathRef {//possibly return CGMutablePathRef
        return CGPathCreateMutableCopy(self)!
    }
    /**
     *
     */
    func transform(path:CGMutablePathRef,transformation:CGAffineTransform)->CGMutablePathRef{
        var transformation:CGAffineTransform = transformation.copy()
        return CGPathCreateMutableCopyByTransformingPath(path, &transformation)!
    }
}