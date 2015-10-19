//Any can represent an instance of any type at all, apart from function types.
//Any allows primitives and class-based objects.
//Here’s an example of using Any to work with a mix of different types, including function types and non-class types. The example creates an array called things, which can store values of type Any:

var things = [Any]()//equivilent code: var things:Array<Any> = []

 
things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })
