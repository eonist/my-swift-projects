#if os(iOS)
import UIKit

class UIColorParser{
    /**
     * Returns random color
     */
    static func random()-> UIColor{
        let r:CGFloat  = CGFloat(arc4random() % 255) / 255.0//Swift 3 upgrade, -> was rand()
        let g:CGFloat  = CGFloat(arc4random() % 255) / 255.0
        let b:CGFloat  = CGFloat(arc4random() % 255) / 255.0
        let uiColor:UIColor = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        return uiColor
    }
}

#endif
