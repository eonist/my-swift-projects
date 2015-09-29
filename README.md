# swift-utils
Generic swift utilities


**XMLParser is inspired by ECMAscript for XML (E4X)**
A simple call to a static method in XMLParser.swift and a tree-structured data set is returned.
You then navigate the tree-structure by dictionary keys and array indecies 
It is based on apples NSXMLParser, in order to keep it simple it uses only Dictionaries and Arrays when traversing the xml data
Its simplicity is great when you just need to get some data, and when you want to understand the code in order to add functionality

```swift
let xml:String = <media><book>The shining</book><music type="digital"></music><media>
let data:Dictionary = XMLParser.data(xml)
XMLParser.data(xml)["content"]["media"][0]["content"]["book"][0]["content"] //Output: The shining
XMLParser.data(xml)["content"]["media"][0]["content"]["music"][0]["attributes"]["type"] //Output: digital

//To create xml:
XMLParser.xml(data)//Output: an xml string
```

