# swift-utils

**XMLParser inspired by E4X**

```swift
//To read xml:
let xml:String = <media><book>The shining</book><music type="digital"></music><media>
let data:Dictionary = XMLParser.data(xml)
XMLParser.data(xml)["."]["media"][0]["."]["book"][0]["."] //Output: The shining
XMLParser.data(xml)["."]["media"][0]["."]["music"][0]["@"]["type"] //Output: digital

//To create xml:
XMLParser.xml(data)//Output: an xml string
```

