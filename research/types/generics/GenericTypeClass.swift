//store different types in the same dataContainer instance:

class Tree <T> {

    // 'T' can now be used as a type
    var value : T

    var children : [Tree <T>] = []

    init(value : T) {
        self.value = value
    }

    func addChild(value : T) -> Tree <T> {”

        let newChild = Tree<T>(value: value)
        children.append(newChild)
        return newChild
    }
}

// Tree of integers
let integerTree = Tree<Int>(value: 5)

// Can add children that contain Ints
integerTree.addChild(10)
integerTree.addChild(5)

// Tree of strings
let stringTree = Tree<String>(value: "Hello")

stringTree.addChild("Yes")
stringTree.addChild("Internets")”

