# swift-utils

**XMLParser inspired by E4X**

```swift
//To read xml:
let xml:String = <media><book>The shining</book><music type="digital"></music><media>
let data:Dictionary = XMLParser.data(xml)
XMLParser.data(xml)["content"]["media"][0]["content"]["book"][0]["content"] //Output: The shining
XMLParser.data(xml)["content"]["media"][0]["content"]["music"][0]["@"]["type"] //Output: digital

//To create xml:
XMLParser.xml(data)//Output: an xml string
```

