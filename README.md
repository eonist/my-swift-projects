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
