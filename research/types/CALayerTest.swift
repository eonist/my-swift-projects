//this is good: http://www.raywenderlich.com/90488/calayer-in-ios-with-swift-10-examples

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