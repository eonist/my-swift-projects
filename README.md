![mit Status](https://img.shields.io/badge/License-MIT-brightgreen.svg) ![platform](https://img.shields.io/badge/Platform-macOS/iOS-blue.svg) ![Lang](https://img.shields.io/badge/Language-Swift%204.1-orange.svg)
[![codebeat](https://codebeat.co/badges/59d2725a-e28e-4da4-9749-3ddc138be55b)](https://codebeat.co/projects/github-com-eonist-swift-utils) [![SPM compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager) 

A collection of my swift util libs:

| Name  |  | Name |  | Name |  |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| [GraphicsLib](#graphicslib)   | <img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/GraphicsLib.svg">  | [GitLib](#gitlib)   | <img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/GitLib.svg">  |  [KeyChainLib](#keychainlib/)  |  <img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/KeyChainLib.svg"> |
| [SVGLib](https://github.com/gitsync/SVGLib)   |  <img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/SvgLib.svg"> | [JSONLib](https://github.com/gitsync/JSONLib)  | <img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/jsonlib3.svg">  | [RegExpLib](https://github.com/gitsync/RegExpLib)  | <img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/RegExpLib.svg">  |
| [MathLib](https://github.com/gitsync/MathLib)   | <img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/MathLib.svg">  | [XMLLib](https://github.com/gitsync/XMLLib)   | <img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/XMLLib.svg"> | [AnimLib](https://github.com/gitsync/AnimLib/)  | <img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/AnimLib.svg">  |
|  [FileWatcher](https://github.com/eonist/FileWatcher)  |  <img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/FileWatcher.svg"> | [FileLib](https://github.com/gitsync/FileLib/)  | <img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/FileLib.svg">  | [ColorLib](https://github.com/gitsync/ColorLib)  |  <img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/ColorLib.svg"> |
| [EventLib](https://github.com/gitsync/EventLib)  | <img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/EventLib.svg"> | [SQLiteLib](https://github.com/gitsync/SQLiteLib)  | <img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/SQLiteLib.svg"> | [ReflectionLib](https://github.com/gitsync/ReflectionLib)   |  | |


## GraphicsLib

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/GraphicsLib.svg">

Simplifies Drawing vector graphics to NSView [More info](http://eon.codes/blog/2015/12/30/Graphic-framework-for-OSX/)   

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


[MIT License](http://opensource.org/licenses/MIT) 


## **GitLib** 

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/GitLib.svg">

- works by utilizing shell and git (CRUD)

```swift
GitParser.status("~/test/","-s")//Outputs the status (compact version)
GitModifier.commit("~/test/", "Bug fix", "Fixed the bug in the code")
GitAsserter.isGitRepo("~/test/.git/")//Output: true or false
```

# **KeyChainLib** 

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/KeyChainLib.svg">

- Basic interaction with Apple KeyChain (Create, Read, Update, Delete)

# SVGLib

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/SvgLib.svg">

- Reads and writes svg syntax 

- [read more about the creation of the svgLib here](http://stylekit.org/blog/2016/01/07/Basic-SVG-support/)  

### Example:
```swift
addSubView(SVGParser.svg(FileParser.xml(~/Desktop/test.svg)))/*Oneliner that adds an SVG to an NSView:*/
```


# JSONLib

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/jsonlib.svg">

- Makes parsing and modifying JSON data easier (CRUD)
- Supports parsing and ~~modifying~~ at deep indices 

```swift
JSONParser
JSONAsserter
JSONType
JSONUtils
```

#### Example:
```swift
/*Dict*/
let dict = JSONParser.dict("{\"title\":\"doctor\"}".json)
print(dict["title"]) //Output: doctor

/*DictArr*/
let dictArr = JSONParser.dictArr("[{\"title\":\"doctor\"}]".json)
dictArr?.forEach{
	print("\(JSONParser.dict($0)?["title"])")
} //doctor
```

# **RegExpLib** 

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/RegExpLib.svg">

- Makes parsing and modifying with RegEx easier  

```swift
"My name is Taylor Swift".match("My name is Taylor (.*)")//Swift
"yeah yeah".replace("(\\b\\w+\\b)", "bla")//bla bla
"hello world".test("o.*o")//true
/*RegExp Exec:*/
let str = "blue:0000FF green:00FF00 red:FF0000"
RegExp.matches(str, "(\\w+?)\\:([A-Z0-9]+?)(?: |$)").forEach {
    Swift.print("match.numberOfRanges: " + "\($0.numberOfRanges)")/*The first item is the entire match*/
    let content = (str as NSString).substringWithRange($0.rangeAtIndex(0))/*the entire match*/
    let name = $0.value(str, 1)/*capturing group 1*/
    let value = $0.value(str, 2)/*capturing group 2*/
}//Outputs: name: green, value: 00FF00...and so on
```

### Another example: 

```swift
let str = "Serial: #YF 1942-b 12/01/17 (Scanned) 12/03/17 (Arrived) ref: 99/99/99"
let usDatePattern:String = "(\\d\\d)[-\\/](\\d\\d)[-\\/](\\d\\d(?:\\d\\d)?)"//Must be in the format: 12-30-1968 (mm-dd-yyyy) works with: "12-30-1968" and "12/30/1968" syntax
let matches = str.matches(usDatePattern)//RegExpMatch.datePattern
matches.forEach {
    let month:String = $0.value(str, 1)
    let day:String = $0.value(str, 2)
    let year:String = $0.value(str, 3)
    let dateStr:String = year + "/" + month + "/" + day
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yy/mm/dd"
    let date:Date? = dateFormatter.date(from: dateStr)
    if date != nil {Swift.print(dateStr)}//Output: 17/12/01, 17/12/03
}
```

The above was actually a challenge with [mathewsanders](https://github.com/mathewsanders)  [Mustard](https://github.com/mathewsanders/Mustard) : [Challenge](https://github.com/mathewsanders/Mustard/issues/8) 


# MathLib

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/MathLib.svg">

- Contains a lot of use full math Utils (Mostly trig and algebra)

# XMLLib

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/XMLLib.svg">

- Makes parsing and modifying xml data easier
- Supports parsing and modifying at deep indices 

### Simple example:
```swift
let xml = "<a><one>text</one></a>".xml
let child = xml.firstNode("one")!
Swift.print(child.value)//Output: text
```

### Advance examples:
```swift
XMLParser.childAt(xml,[0,2,1])//Output: the second item in the third item in root
XMLModifier.setAttributeAt(xml,[0,1],["color":"blue","gradient":"teal"])//Sets the color and gradient attributes in the second item in root
```

### Creating XML from String:
```swift
let xml = "<data></data>".xml
xml.appendChild("<files></files>".xml)
let file = "<file></file>".xml
file["date"] = "2022-10-02"
file.stringValue = "/Desktop/temp.jpg"
xml.firstNode("files").appendChild(file)
print(xml.XMLString)//Output: "<data><files><file date=\"2022-10-02\">/Desktop/temp.jpg</file></files></data>"
```

# **Animator** 

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/AnimLib.svg">

### Introduction:

Animator is an attempt at striking a balance between the 4 areas of programmatic animation: Ease-of use, Customizability, Features and Performance.

### Features:

- Supports all common easing equations
- Interactive spring dynamics. Friction, SpringStrength etc. 
- The Spring solver has a small footprint and is easily customizable. 
- 60FPS (CVDisplayLink)
- Works with interaction (This is rare on apple platforms)
- Small footprint (Just a few functions and classes)
- Supports all the regular call-backs (onComplete etc)
- CPU friendly. Stops when there is no animation etc

### Why can't we just use UIViewPropertyAnimator?

In iOS 10 apple gave us "UIViewPropertyAnimator" Which was a big level up in the interruptible animation genre. However this too is limited in nature. And leaves a lot to be desired:

1. You don't have a onProgress callBack method when using UIViewPropertyAnimator 

2. Many of the layer’s properties are unsupported. (shadow, border, 3d transform) (won’t support arc)

3. Also the animations are limited to UIView Animatable Properties, which are: frame, bounds, center, transform, alpha, backgroundColor, contentStretch

4. No keyframe based animation

### How does it work?:

Springer and Easer can be used to manipulate any value. Which enables you to animate color transition. Rotation, shadow, gradient, 3d perspectives or any other variable. unlike apples built in animation system this Animation lib enables you to animate any property you desire as long as you extend this value type with Animatable. You can also Extend the Easer or Springer class with your own Custom class so that it can have more custom logic. Say you want to add some log10 friction or add a few constraints. The possibilities are endless. Animator also does more stock like animations similar to Apples Animation classes. 


## FileWatcher

A simple File watcher in swift.

Example (this will monitor your Desktop for any file changes): 

```swift
let filewatcher = FileWatcher([NSString(string: "~/Desktop").expandingTildeInPath])
    
filewatcher.callback = { event in
  print("Something happened here: " + event.path)
}
    
filewatcher.start() // start monitoring
```
### Running FileWatcher on a background thread

The above example will run FileWatcher (ie. its callback function) from the current thread. However, if your callback needs to run for any significatant amount of time (for example when monitoring a folder for photos and you need to run a lenghty image processing algorithm on them), this is rarely a good idea.

If you'd rather have your callback running on a background thread, you can provide your own queue, and FileWatcher will use that (instead of the default current thread / run loop):

```swift
filewatcher.queue = DispatchQueue.global()
```

### Notes and documentation:
[wiki](https://github.com/eonist/FileWatcher/wiki)  
Swift-Style-Guide: [raywenderlich](https://github.com/raywenderlich/swift-style-guide) 

# **FileLib** 

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/FileLib.svg">

- Open,Save,Delete,Create (CRUD)

### A few examples:

```swift
FileModifier.write("~/Desktop/temp.txt".tildePath, "test")
FileAsserter.exists("~/Desktop/temp.txt".tildePath)//Output: true
FileParser.content("~/Desktop/temp.txt".tildePath)//Output: test
```

# **ColorLib**

<img width="100" alt="img" src="https://rawgit.com/stylekit/img/master/ColorLib.svg">

- Easily convert between color types: ColorLib, RGB, CMYK, HSL, HSB, HSB, NSColor, CGColor, CLColor
- Supporting 7 "Hex" color types:


There are 7 "hex" color formats: ""#FF0000","0xFF0000", "FF0000", "F00", "red", 0x00FF00 , 16711935
```
ColorParser.nsColor("#FF0000",1)//red nsColor
ColorParser.nsColor("FF0",1)//red nsColor
ColorParser.nsColor("0xFF0000",1)//red nsColor
ColorParser.nsColor("#FF0000",1)//red nsColor
ColorParser.nsColor("FF0000",1)//red nsColor
ColorParser.nsColor(0xFF0000,1)//red nsColor
ColorParser.nsColor(16711935,1)//red nsColor
```

### Interpolation:

<img width="100" alt="img" src="https://raw.githubusercontent.com/stylekit/img/master/color_interpolation_take_three.gif">

The above animation can be achieved with the simple line bellow  

```swift
let color = NSColor.green.interpolate(.blue, 0.5)
```

# EventLib

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
    if event.assert(.update,origin:a){
        print("something happened on: \(event.origin) for event type: \(event.type)")
    } 
}
a.event = onSomeEvent
a.doSomething()//Output: something happened on: A for event type: eventUpdate
```

Read about the event system here: http://stylekit.org/blog/2016/02/10/The-event-system/  

# Reflection and unwrapping
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

