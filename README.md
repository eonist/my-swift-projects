# swift-utils
Generic swift utilities
## Index:  
- **SVGLib** (Read and write svg syntax) [read more about the creation of the svgLib here](http://stylekit.org/blog/2016/01/07/Basic-SVG-support/)  
- **GraphicsKit** (Makes working with Quartz and core data easier) [read more about the GraphicsKit here](http://stylekit.org/blog/2015/12/30/Graphic-framework-for-OSX/)  
- **XMLLib** (Makes parsing and modifying xml data easier)  
- **RegExpLib** (Makes parsing and modifying with RegExp easier)  
- **MathLib** (Contains a lot of use full math Utils, more to come)  
- **SQLLiteLib** - works by utilizing shell (Comming soon, see my applescript lib for now)  
- **GitLib** - works by utilizing shell and git 
- **FileLib** - Open,Save,Delete,Create
- **KeyChainLib** - Basic interaction with Apple KeyChain
- **AnimLib** - 60FPS Animation library. Supports interaction
- **Utils** - Other basic programming utilities for working with array, dictionary, numbers, strings etc
- **Color Kit** - ColorLib, RGB, CMYK, HSL, HSB, HSB, NSColor, CGColor, CLColor

## **GraphicsKit**

<img width="650" alt="img" src="https://dl.dropboxusercontent.com/u/2559476/Screen Shot 2015-12-26 at 10.30.58.png">

Read more about the GraphicKit [here](http://stylekit.org/blog/2015/12/30/Graphic-framework-for-OSX/)   
The swift code for the above example:  

```swift
/*Gradients*/
let gradient = LinearGradient(Gradients.red(),[],π/2)
let lineGradient = LinearGradient(Gradients.teal(0.5),[],π/2)
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
**NOTE:** Also supports RadialGradient now example of this coming soon
The graphics framework is open source and can be found on github [here](https://github.com/eonist/swift-utils)   



## **Color Kit**
Supporting 7 Hex color types
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

## Event system 
- Small footprint: Only 2 methods and a variable
- Propagates up class hierarchies. That extend the EventSender
- Basic event concept: EventHandler, Event, EventSender 
- Determine where the event came from with origin and immediate
 
Simple Example:  
```swift
class A:EventSender{
    func doSomething(){
        onEvent(Event(Event.update,self)) 
    }
}
var a = A()
func onSomeEvent(event:Event){/*<--Event handler*/
    if(event.type == Event.update && event.origin === a){
        print("something happened")
    } 
}
a.event = onSomeEvent
a.doSomething()//Output: something happened
```

Read about the event system here: http://stylekit.org/blog/2016/02/10/The-event-system/  


## FileWatcher

A simple File watcher in swift. Example code: 

```swift
var fileWatcher = FileWatcher(["~/Desktop/test/".tildePath])/*<---the fileWatcher instance must be scoped to your class*/
        
fileWatcher!.event = { [weak self] event in//<--The weak self part enables you to interact with your app
    Swift.print(self?.someVariable)//Outputs: a variable in your current class
    Swift.print(event.description)//Outputs: a description of the file change
}
```

[MIT License](http://opensource.org/licenses/MIT) 
