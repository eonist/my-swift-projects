**XMLParser** inspired by E4X

```swift
//Read XML:
let xml:String = <media><book>The shining</book><music type="digital"></music><media>
let data:Dictionary = XMLParser.data(xml)
data["."]["media"][0]["."]["book"][0]["."] //Output: The shining
data["."]["media"][0]["."]["music"][0]["@"]["type"] //Output: digital
XMLParser.children(data["."])//Output: Array with root children
//Create XML:
XMLParser.xml(data)//Output: an xml string
```