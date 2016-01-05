# swift-utils
Generic swift utilities
## Index:  
- **SVGLib** (Read and write svg syntax)  
- **GraphicsLib** (Makes working with Quartz and core data easier)  
- **XMLLib** (Makes parsing and modifying xml data easier)  
- **RegExpLib** (Makes parsing and modifying with RegExp easier)  
- **MathLib** (Contains alot of usefull math Utils, more to come)  
- **SQLLiteLib** - works by utilizing shell (Comming soon, see my applescript lib for now)  
- **GitLib** - works by utilizing shell and git (Comming soon, see my applescript lib for now)  
- **Utils** - Other basic programming utilites for working with array, dictionary, numbers, strings etc

## **Graphic framework for OSX**

<img width="650" alt="img" src="https://dl.dropboxusercontent.com/u/2559476/Screen Shot 2015-12-26 at 10.30.58.png">

The swift code for the above example:  

```swift
/*Gradients*/
let gradient = Gradient(Gradients.red(),[],GradientType.Linear,π/2)
let lineGradient = Gradient(Gradients.teal(0.5),[],GradientType.Linear,π/2)
/*Styles*/
let fill:GradientFillStyle = GradientFillStyle(gradient);
let lineStyle = LineStyle(20,NSColorParser.nsColor(Colors.green()).alpha(0.5),CGLineCap.Round)
let line = GradientLineStyle(lineGradient,lineStyle)
/*Rect*/
let rect = RectGraphic(40,40,200,200,fill,line)
addSubview(rect.graphic)
rect.draw()
/*Ellipse*/
let ellipse = EllipseGraphic(300,40,200,200,fill.mix(Gradients.teal()),line.mix(Gradients.blue(0.5)))
addSubview(ellipse.graphic)
ellipse.draw()
/*RoundRect*/
let roundRect = RoundRectGraphic(40,300,200,200,Fillet(50),fill.mix(Gradients.orange()),line.mix(Gradients.yellow(0.5)))
addSubview(roundRect.graphic)
roundRect.draw()
/*Line*/
let lineGraphic = LineGraphic(CGPoint(300,300),CGPoint(500,500),line.mix(Gradients.deepPurple()))
addSubview(lineGraphic.graphic)
lineGraphic.draw()
```

The graphics framework is open source and can be found on github [here](https://github.com/eonist/swift-utils)   



## **Supporting 7 Hex color types**

There are 7 hex color formats: ""#FF0000","0xFF0000", "FF0000", "F00", "red", 0x00FF00 , 16711935
```
ColorParser.nsColor("#FF0000",1)//red nsColor
ColorParser.nsColor("FF0",1)//red nsColor
ColorParser.nsColor("0xFF0000",1)//red nsColor
ColorParser.nsColor("#FF0000",1)//red nsColor
ColorParser.nsColor("FF0000",1)//red nsColor
ColorParser.nsColor(0xFF0000,1)//red nsColor
ColorParser.nsColor(16711935,1)//red nsColor
```

[License](http://opensource.org/licenses/MIT) 