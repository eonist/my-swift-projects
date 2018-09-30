#if os(OSX)
#else
import UIKit.UIView
extension UIView{
    /**
     * Returns a ViewController of a class Kind
     * EXAMPLE: UIView.vc(vcKind: CustomViewController.self)//ref to an instance of CustomViewController
     */
    public static func vc<T:UIViewController>(vcKind:T.Type? = nil) -> T?{
        guard let appDelegate:AppDelegate = UIApplication.shared.delegate as? AppDelegate else {return nil}
        if let vc = appDelegate.window?.rootViewController as? T {
            return vc
        }else if let vc = appDelegate.window?.rootViewController?.presentedViewController as? T {
            return vc
        }else if let vc = appDelegate.window?.rootViewController?.childViewControllers  {
            return vc.lazy.flatMap{$0 as? T}.first
        }
        return nil
    }
    public static func topMostController() -> UIViewController? {
        var topController: UIViewController? = UIApplication.sharedApplication().keyWindow?.rootViewController?
        while topController.presentedViewController != nil {
            topController = topController.presentedViewController!
        }
        return topController
    }
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    /**
     * Creates UIImage from a view
     */
    var snapShot:UIImage?{
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0)
        self.drawHierarchy(in: self.frame, afterScreenUpdates: true)
        let image:UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    /**
     * Returns rotation of view
     */
    var rotation:CGFloat{
        let radians = atan2(self.transform.b, self.transform.a)
        let degrees = radians * 180 / .pi
        return degrees
    }
    /**
     * NOTE: this method gives you the scale regardless of rotation or translation applied to transform:
     * REF: https://stackoverflow.com/a/46223255/5389500
     */
    var scale:CGFloat {
        return sqrt(self.transform.a * self.transform.a + self.transform.c * self.transform.c)
    }
}
#endif
