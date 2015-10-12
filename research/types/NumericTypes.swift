//ints
func test(){
    let someInt:Int = 33
    someInt.predecessor()//32
    someInt.successor()//34
    someInt.advancedBy(2)//35,returns the value doesnt set the value
    someInt.advancedBy(-2)//31,returns the value doesnt set the value
    someInt.distanceTo(40)//7
    
    
    var (result, overflowed) = Int.addWithOverflow(12, 34)
    print(result)
    print(overflowed)
    (result, overflowed) = Int.subtractWithOverflow(-128, 256)
    print(result)
    print(overflowed)
    (result, overflowed) = Int.multiplyWithOverflow(128, 1024)
    print(result)
    print(overflowed)
    (result, overflowed) = Int.divideWithOverflow(22, 7)
    print(result)
    print(overflowed)
    Int.max
    Int.min
    
    
    (result, overflowed) = Int.multiplyWithOverflow(Int.max,Int.max)
    print(result)
    print(overflowed)
    Int8.min
    Int8.max
    
    Int16.min
    Int16.max
    Int32.min
    Int32.max
    Int64.min
    Int64.max
    
    
    
    //floats and doubles
    
    let pi = 3.14159
    let f_pi: Float = 3.141592
    let theResult = sizeofValue(pi)
    print(theResult)
    print(sizeofValue(f_pi))
    pi.advancedBy(1)
    pi.advancedBy(-2)
    pi.distanceTo(2.0)
    print(Double.abs(2.0))
    print(Double.abs(-2.0))
    print(Float.abs(2.0))
    print(Float.abs(-2.0))
}



