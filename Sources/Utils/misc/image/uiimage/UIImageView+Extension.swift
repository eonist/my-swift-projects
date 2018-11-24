import UIKit

extension UIImageView{
    typealias OnError = (UIImage.IMGError?) -> Void
    static var defaultErrorHandler:OnError = { err in
        Swift.print("img error:  \(String(describing: err))")
    }
    /**
     * Simplifies loading an image from a weburl to uiimageview
     */
    convenience init(webPath:String,useBGThread:Bool = true,onError:@escaping OnError = defaultErrorHandler) {
        self.init()
        setImage(webPath: webPath, useBGThread: useBGThread)
    }
    /**
     * Create UIIMageView from filePath
     */
    convenience init(filePath:String){//should throw?
        let img = UIImage.init(contentsOfFile: filePath)
        self.init(image: img)
    }
    /**
     * Sets image async
     */
    func setImage(webPath:String,useBGThread:Bool = true,onError:@escaping OnError = defaultErrorHandler){
        let thread:DispatchQueue = (useBGThread ? .global(qos: .background) : .main)//create bg or main thread
        thread.async {
            UIImage.image(webPath: webPath) { (image:UIImage?,error:UIImage.IMGError?) in
                if let img = image {
                    DispatchQueue.main.async {//UI stuff must happen on the main thread
                        self.image = img//set the image
                    }
                }else{
                    onError(error)//call the error handler
                }
            }
        }
    }
}

