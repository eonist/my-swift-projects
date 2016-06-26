![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg) ![platform](https://img.shields.io/badge/Platform-OSX/iOS-blue.svg) ![Lang](https://img.shields.io/badge/Language-Swift-orange.svg) [![codebeat](https://codebeat.co/badges/59d2725a-e28e-4da4-9749-3ddc138be55b)](https://codebeat.co/projects/github-com-eonist-swift-utils)

## Content of page:  

- [GraphicsLib](#graphicslib) 
- [SVGLib](#svglib) 
- [XMLLib](#xmllib) 
- [RegExpLib](#regexplib) 
- [MathLib](#mathlib) 
- [SQLLiteLib](#sqllitelib) 
- [GitLib](#gitlib) 
- [FileLib](#filelib) 
- [KeyChainLib](#keychainlib) 
- [AnimLib](#animlib) 
- [ColorLib](#colorlib) 
- [Utils](#utils)


## **GraphicsLib**

<img width="100" alt="img" src="https://dl.dropboxusercontent.com/u/2559476/GraphicsLib.svg">

Read more about the GraphicsLib [here](http://stylekit.org/blog/2015/12/30/Graphic-framework-for-OSX/)   

<img width="650" alt="img" src="https://dl.dropboxusercontent.com/u/2559476/Screen Shot 2015-12-26 at 10.30.58.png">


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


## **SVGLib** 

<img width="100" alt="img" src="https://dl.dropboxusercontent.com/u/2559476/SvgLib.svg">

- Read and write svg syntax (CRUD)

- [read more about the creation of the svgLib here](http://stylekit.org/blog/2016/01/07/Basic-SVG-support/)  


## **MathLib** 

<img width="100" alt="img" src="https://dl.dropboxusercontent.com/u/2559476/MathLib.svg">

- Contains a lot of use full math Utils, more to come)

## **SQLLiteLib** 

<img width="100" alt="img" src="https://dl.dropboxusercontent.com/u/2559476/SQLiteLib.svg">

- works by utilizing shell (CRUD)

## **GitLib** 

<img width="100" alt="img" src="https://dl.dropboxusercontent.com/u/2559476/GitLib.svg">

- works by utilizing shell and git (CRUD)

```swift
GitParser.status("~/test/","-s")//Outputs the status (compact version)
GitModifier.commit("~/test/", "Bug fix", "Fixed the bug in the code")
GitAsserter.isGitRepo("~/test/.git/")//Output: true or false
```

## **XMLLib** 

<img width="100" alt="img" src="https://dl.dropboxusercontent.com/u/2559476/XMLLib.svg">

- Makes parsing and modifying xml data easier (CRUD)
- Supports parsing and modifying at deep indices 

```swift
XMLParser.childAt(xml,[0,2,1])//Output: the second item in the third item in root
XMLModifier.setAttributeAt(xml,[0,1],["color":"blue","gradient":"teal"])//Sets the color and gradient attributes in the second item in root
```

## **FileLib** 

<img width="100" alt="img" src="https://dl.dropboxusercontent.com/u/2559476/FileLib.svg">

- Open,Save,Delete,Create (CRUD)

## **KeyChainLib** 

<img width="100" alt="img" src="https://dl.dropboxusercontent.com/u/2559476/KeyChainLib.svg">

- Basic interaction with Apple KeyChain (Create, Read, Update, Delete)

## **RegExpLib** 

<img width="100" alt="img" src="https://dl.dropboxusercontent.com/u/2559476/RegExpLib.svg">

- Makes parsing and modifying with RegExp easier  

## **AnimLib** 

<img width="100" alt="img" src="https://dl.dropboxusercontent.com/u/2559476/AnimLib.svg">

- Supports all common easing equations
- Interactive spring dynamics. Friction, SpringStrength etc. 
- The Spring solver has a small footprint and is easily customizable. 
- 60FPS (CVDisplayLink)
- Works with interaction (This is rare on apple platforms)
- Small footprint (Just a few functions and classes)
- Supports all the regular call-backs (onComplete etc)
- CPU friendly. Stops when there is no animation etc


## **ColorLib**

<img width="100" alt="img" src="https://dl.dropboxusercontent.com/u/2559476/ColorLib.svg">

- Easily convert between color types: ColorLib, RGB, CMYK, HSL, HSB, HSB, NSColor, CGColor, CLColor
- Supporting 7 Hex color types:
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

## EventLib

<img width="100" alt="img" src="https://dl.dropboxusercontent.com/u/2559476/EventLib.svg">
 
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

<img width="100" alt="img" src="https://dl.dropboxusercontent.com/u/2559476/FileWatcher.svg">

A simple File watcher in swift. Example code: 

```swift
var fileWatcher = FileWatcher(["~/Desktop/test/".tildePath])/*<---the fileWatcher instance must be scoped to your class*/
        
fileWatcher!.event = { [weak self] event in//<--The weak self part enables you to interact with your app
    Swift.print(self?.someVariable)//Outputs: a variable in your current class
    Swift.print(event.description)//Outputs: a description of the file change
}
```

## **Utils** 

- Other basic programming utilities for working with array, dictionary, numbers, strings etc


[MIT License](http://opensource.org/licenses/MIT) 
