# swift-utils
Generic swift utilities


XMLParser is a dead simple way to parse an xml document.
A simple call to a static method in XMLParser.swift and a treestruecture data set is returned.
You then navigate the tree-structure by array indecies and dictionary keys
It is based on apples NSXMLParser, in order to keep it simple it uses only Dictionaries and Arrays when traversing the xml data

```swift
import XMLParser.swift
let xml:String = <media><book>The shining</book><music type="digital"></music><media>
let data:Dictionary = XMLParser.data(xml)
XMLParser.data(xml)["content"]["media"][0]["content"]["book"][0]["content"] //Output: The shining
XMLParser.data(xml)["content"]["media"][0]["content"]["music"][0]["attributes"]["type"] //Output: digital

```

