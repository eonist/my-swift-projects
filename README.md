![mit Status](https://img.shields.io/badge/License-MIT-brightgreen.svg) ![platform](https://img.shields.io/badge/Platform-macOS/iOS-blue.svg) ![Lang](https://img.shields.io/badge/Language-Swift%203.0.1-orange.svg)
[![codebeat](https://codebeat.co/badges/59d2725a-e28e-4da4-9749-3ddc138be55b)](https://codebeat.co/projects/github-com-eonist-swift-utils) [![SPM compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager) [![Build Status](https://travis-ci.org/stylekit/swift-utils-tests.svg?branch=master)](https://travis-ci.org/stylekit/swift-utils-tests)

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
- [FileWatcher](#filewatcher)


## **GraphicsLib**

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/GraphicsLib.svg">

Read more about the GraphicsLib [here](http://stylekit.org/blog/2015/12/30/Graphic-framework-for-OSX/)   

<img width="650" alt="img" src="https://raw.githubusercontent.com/stylekit/img/master/Screen Shot 2015-12-26 at 10.30.58.png">

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

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/SvgLib.svg">

- Read and write svg syntax (CRUD)

- [read more about the creation of the svgLib here](http://stylekit.org/blog/2016/01/07/Basic-SVG-support/)  


## **MathLib** 

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/MathLib.svg">

- Contains a lot of use full math Utils, more to come)

## **SQLLiteLib** 

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/SQLiteLib.svg">

- works by utilizing shell (CRUD)

## **GitLib** 

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/GitLib.svg">

- works by utilizing shell and git (CRUD)

```swift
GitParser.status("~/test/","-s")//Outputs the status (compact version)
GitModifier.commit("~/test/", "Bug fix", "Fixed the bug in the code")
GitAsserter.isGitRepo("~/test/.git/")//Output: true or false
```

## **XMLLib** 

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/XMLLib.svg">

- Makes parsing and modifying xml data easier (CRUD)
- Supports parsing and modifying at deep indices 

```swift
/*Simple example:*/
let xml = "<a><one>text</one></a>".xml
let child = xml.firstNode("one")!
Swift.print(child.value)//Output: text
/*Advance examples:*/
XMLParser.childAt(xml,[0,2,1])//Output: the second item in the third item in root
XMLModifier.setAttributeAt(xml,[0,1],["color":"blue","gradient":"teal"])//Sets the color and gradient attributes in the second item in root
/*Creating xml:*/
let xml = "<data></data>".xml
xml.appendChild("<files></files>".xml)
let file = "<file></file>".xml
file["date"] = "2022-10-02"
file.stringValue = "/Desktop/temp.jpg"
xml.firstNode("files").appendChild(file)
print(xml.XMLString)//Output: "<data><files><file date=\"2022-10-02\">/Desktop/temp.jpg</file></files></data>"
```

## **FileLib** 

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/FileLib.svg">

- Open,Save,Delete,Create (CRUD)

```swift
FileModifier.write("~/Desktop/temp.txt".tildePath, "test")
FileAsserter.exists("~/Desktop/temp.txt".tildePath)//Output: true
FileParser.content("~/Desktop/temp.txt".tildePath)//Output: test
```

## **KeyChainLib** 

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/KeyChainLib.svg">

- Basic interaction with Apple KeyChain (Create, Read, Update, Delete)

## **RegExpLib** 

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/RegExpLib.svg">

- Makes parsing and modifying with RegEx easier  

```swift
RegExp.match("My name is Taylor Swift","My name is Taylor (.*)")//Swift
RegExp.replace("yeah yeah","(\\b\\w+\\b)", "bla")//bla bla
RegExp.test("hello world","o.*o")//true
/*RegExp Exec:*/
let str = "blue:0000FF green:00FF00 red:FF0000"
RegExp.matches(str, "(\\w+?)\\:([A-Z0-9]+?)(?: |$)").forEach {
    Swift.print("match.numberOfRanges: " + "\($0.numberOfRanges)")/*The first item is the entire match*/
    let content = (str as NSString).substringWithRange($0.rangeAtIndex(0))/*the entire match*/
    let name = $0.value(str, 1)/*capturing group 1*/
    let value = $0.value(str, 2)/*capturing group 2*/
}//Outputs: name: green, value: 00FF00...and so on
```

## **AnimLib** 

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/AnimLib.svg">

- Supports all common easing equations
- Interactive spring dynamics. Friction, SpringStrength etc. 
- The Spring solver has a small footprint and is easily customizable. 
- 60FPS (CVDisplayLink)
- Works with interaction (This is rare on apple platforms)
- Small footprint (Just a few functions and classes)
- Supports all the regular call-backs (onComplete etc)
- CPU friendly. Stops when there is no animation etc

In the example bellow, a clock pointer rotates 3 times: 

```swift
let line:LineGraphic = addSubView(LineGraphic())
let animator = LoopingAnimator(Animation.sharedInstance,3,1,0,1,progress,Easing.easeLinear)
func progress(value:CGFloat){
   let angle = π * 2  * value
   line.p2 = line.p1.polarPoint(50,angle)
   line.draw()
}
animator.start()
```

## **ColorLib**

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/ColorLib.svg">

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

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/EventLib.svg">
 
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

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/FileWatcher.svg">

A simple File watcher in swift. Example code: 

```swift
var fileWatcher = FileWatcher(["~/Desktop/test/".tildePath])/*<---the fileWatcher instance must be scoped to your class*/
        
fileWatcher!.event = { [weak self] event in//<--The weak self part enables you to interact with your app
    Swift.print(self?.someVariable)//Outputs: a variable in your current class
    Swift.print(event.description)//Outputs: a description of the file change
}
```

## Reflection and unwrapping
Features:  
- Reflection (to XML)
- UnWrapping (from XML)
- Class and StructSupport
- Array and Dictionary Support
- Inheritance support (OOP)

```swift
/**
 * NOTE: we use 32 bit RGBA values when storing color data (This also stores the alpha value)
 * NOTE: XML is used as the storage syntax. JSON could be used but there was no apparent benefit so XML it is
 */
let temp = Temp(NSColor.redColor())
let xml = Reflection.toXML(temp)/*Reflection*/
print(xml.XMLString)//Output: <Temp><color type="NSColor">FFFF0000</color></Temp>
let newInstance = Temp.unWrap(xml)!/*UnWrapping*/
print(newInstance.color.hexString)//Output: FF0000

class Temp{
    var color:NSColor
    init(_ color:NSColor){
        self.color = color
    }
}
extension Temp:UnWrappable{
    static func unWrap<T>(xml:XML) -> T? {
        let color:NSColor? = unWrap(xml,"color")
        return Temp(color!) as? T
    }
}

```

## **Utils** 

- Other basic programming utilities for working with array, dictionary, numbers, strings etc


## Progress:

**2017-mar** 
- RubberBand now supports X & Y axis  



[MIT License](http://opensource.org/licenses/MIT) 
