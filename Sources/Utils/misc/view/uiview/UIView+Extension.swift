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
        if let viewController = appDelegate.window?.rootViewController?.presentedViewController as? T {
            return viewController
        }else if let viewControllers = appDelegate.window?.rootViewController?.childViewControllers  {
            return viewControllers.lazy.flatMap{$0 as? T}.first
        }
        return nil
    }
}
#endif
