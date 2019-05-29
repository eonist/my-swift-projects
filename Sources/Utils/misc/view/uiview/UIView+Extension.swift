#if os(OSX)
#else
import UIKit.UIView

/**
 * Controller related
 */
extension UIView{
  /**
     * Traverses the entire UIView hirearchy and collects views that are of speccific PARAM: type
     * TODO: ⚠️️ this can be written more elegantly with flatmap
     */
    func descendants<T>(type: T.Type? = nil) -> [T] {
        var subViewsOfType: [T] = []
        self.subviews.forEach {
            if let subView: T = ($0 as? T) {
                subViewsOfType.append(subView)
            }
            if !$0.subviews.isEmpty {
                subViewsOfType += $0.descendants(type: type)
            }
        }
        return subViewsOfType
    }
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
   /*
   * Returns the top most viewController
   */
   public static func topMostController() -> UIViewController? {
      var topController: UIViewController? = UIApplication.sharedApplication().keyWindow?.rootViewController?
      while topController.presentedViewController != nil {
           topController = topController.presentedViewController!
      }
      return topController
   }
   /**
    * Returns parent viewController
    */
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
    * Easily get Controller
    */
   func controller() -> UIViewController? {
        if let nextViewControllerResponder = next as? UIViewController {
            return nextViewControllerResponder
        } else if let nextViewResponder = next as? UIView {
            return nextViewResponder.controller()
        } else  {
            return nil
        }
    }
   /**
    * Easily get navController from
    */
    func navigationController() -> UINavigationController? {
        guard let controller = controller() else { return nil }
        return controller.navigationController
    }
}
/**
 * Other
 */
extension UIView{
    /**
     * Creates UIImage from a view
     * - Important: ⚠️️ if you get the "invalid context 0x0" error, make sure your View has a frame. view.bounds must not be .zerp
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
