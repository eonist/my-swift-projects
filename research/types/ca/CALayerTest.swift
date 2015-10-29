//this is good: http://www.raywenderlich.com/90488/calayer-in-ios-with-swift-10-examples



/*
Properties of CALayer:

class CALayer: NSObject {
    var bounds: CGRect
    var position: CGPoint
    var zPosition: CGFloat
    var frame: CGRect

    var opacity: CGFloat
    var hidden: Bool
    var mask: CALayer!
    var borderWidth: CGFloat
    var borderColor: CGColor!
    var cornerRadius: CGFloat
    var shadowOpacity: CGFloat
    var shadowRadius: CGFloat
	 var shadowOffset: CGSize
    var shadowColor: CGColor!

    var actions: [NSObject : AnyObject]!  // Defaults to nil!
    var delegate: AnyObject! // NSObject (CALayerDelegate)
    // ...
*/
/*
Draw an image in an calayer:

CALayer *sublayer = [CALayer layer];
sublayer.backgroundColor = [UIColor blueColor].CGColor;
sublayer.shadowOffset = CGSizeMake(0, 3);
sublayer.shadowRadius = 5.0;
sublayer.shadowColor = [UIColor blackColor].CGColor;
sublayer.shadowOpacity = 0.8;
sublayer.frame = CGRectMake(30, 30, 128, 192);
sublayer.borderColor = [UIColor blackColor].CGColor;
sublayer.borderWidth = 2.0;
sublayer.cornerRadius = 10.0;
[self.view.layer addSublayer:sublayer];
 
CALayer *imageLayer = [CALayer layer];
imageLayer.frame = sublayer.bounds;
imageLayer.cornerRadius = 10.0;
imageLayer.contents = (id) [UIImage imageNamed:@"BattleMapSplashScreen.jpg"].CGImage;
imageLayer.masksToBounds = YES;
[sublayer addSublayer:imageLayer];
*/



/*
//more in the COcoa book from big nerd ranch
//TextLayer: 
let textContainer = CALayer()
        textContainer.anchorPoint = CGPoint.zeroPoint
        textContainer.position = CGPointMake(10, 10)
        textContainer.zPosition = 100
        textContainer.backgroundColor = NSColor.blackColor().CGColor
        textContainer.borderColor = NSColor.whiteColor().CGColor
        textContainer.borderWidth = 2
        textContainer.cornerRadius = 15
        textContainer.shadowOpacity = 0.5
        view.layer!.addSublayer(textContainer)

        let textLayer = CATextLayer()
        textLayer.anchorPoint = CGPoint.zeroPoint
        textLayer.position = CGPointMake(10, 6)
        textLayer.zPosition = 100
        textLayer.fontSize = 24
        textLayer.foregroundColor = NSColor.whiteColor().CGColor
        self.textLayer = textLayer”

		   textContainer.addSublayer(textLayer)
*/