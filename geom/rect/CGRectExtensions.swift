import Foundation

extension CGRect {
    /**
     *
     */
    func clone()->CGRect{
        return CGRect(self.origin.x,self.origin.y,self.width,self.height)
    }
}


//make the conventient init with x,y etc and also implement x,y as get values