// CGSize struct
import Foundation


// access struct members
func test(){
    let size : CGSize = CGSizeMake(100, 100)
    print(size.height)
    print(size.width)
    
    // CGPoint struct
    let screenLocation : CGPoint = CGPointMake(45,100)
    screenLocation.x
    screenLocation.y
    // CGRect struct
    let rectangle:CGRect = CGRectMake(10, 10, 400, 400)
    print(rectangle.width)
    print(rectangle.height)
    //
    struct Size {
        var width = 0.0, height = 0.0
    }
    
    let twoByTwo:Size = Size(width: 2.0, height: 2.0)
    print(twoByTwo.width)

}
