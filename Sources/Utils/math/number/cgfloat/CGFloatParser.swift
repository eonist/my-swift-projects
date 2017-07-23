import Foundation

public class CGFloatParser{
    /**
     * Returns the number with a set number of PARAM: decimalCount
     * NOTE: unlike the tofixed method that returns this: Number(6.0001).toFixed(2)// 6.01, the aprox method returns a more clinical number
     * NOTE: the approx method does not Round up or down by taking into account the decimal after the PARAM: decimalCount, this could be usefull in the future
     * NOTE: the approx method works exactly as the aproximatly equal sign in real math except the part about rounding up and down, and by the way toFixed method does not handle the rounding correctly eigther as it rounds from futher then next to PARAM: decimalCount
     * EXAMPLE: NumberParser.approx(Math.cos(Trig.RAD*90), 22)//6.12323e-17
     * EXAMPLE: NumberParser.approx(Math.cos(Trig.RAD*90), 3)//0
     * EXAMPLE: approx(40.126,2)//40.13
     * EXAMPLE: approx(40.124,2)//40.12
     * CAUTION: the old approx method was a little different. try stackoverflow if this design doesn't work in every case
     */
    static func approx(_ number:CGFloat,_ decimalCount:Int) -> CGFloat{
        let format = NSString(format: "%%.%if", decimalCount)
        let string = NSString(format: format, number)
        return CGFloat(atof(string.utf8String))
    }
    /**
     * Return odd numbers
     */
    static func odds(_ numbers:[CGFloat])->[CGFloat]{
        let odds = numbers.filter{($0 %% 2.0) == 1}//greate example of the filter method
        return odds
    }
    /**
     * sums numbers with addition
     * TODO: add an option for multiplication minus and dividens
     */
    static func sum(_ numbers:[CGFloat])->CGFloat {
        return numbers.reduce(0) {$0 + $1}
    }
    /**
     * Returns the number you can add to start that becomes end (start + x = end)
     * NOTE: unlike the distance method this can return negative and positive values
     * NOTE: suppliments the distance function in that it returns the directional correct distance
     * TODO: couldnt you just do b - a ? there is no difference, this method is a waste of cpu
     * EXAMPLE:
     * print(difference(3,7))//4
     * print(difference(3,-2))//-5
     * print(difference(-3,-7))//-4
     * print(difference(-3,7))//10
     */
    static func difference(_ a:CGFloat, _ b:CGFloat)->CGFloat{
        let distance:CGFloat = CGFloatParser.distance(a, b)
        if(a > b) {return -distance}
        else if(a < b) {return distance}
        else {return 0}
    }
    /**
     * Linearly interpolation (lerp)
     * PARAM: a: start number
     * PARAM: b: end number
     * PARAM: fraction: interpolation value (between 0 - 1) could also be named scalar
     * EXAMPLE: interpolate(5, 15, 0.5) //10
     */
    static func interpolate(_ a: CGFloat, _ b: CGFloat, _ fraction: CGFloat) -> CGFloat {
        return fraction * (b - a) + a
    }
    /**
     * Returns the scalar value from the real progress between two polar numbers
     * Return: interpolation value between if transition value is within range it will be between 0 and 1 (scalar amount)
     * NOTE: to find a scalar value i.e 50/100 = 0.5
     * PARAM: start: start number
     * PARAM: end: end number
     * PARAM: progress progress between a and b
     * EXAMPLE: scalar(0,8,4) //Output: 0.5
     * print("q: " + NumberParser.scalar(0, -100, -25));//0.25
     * print("q: " + NumberParser.scalar(-200, -100, -150));//0.5
     * print("q: " + NumberParser.scalar(5, 10, 7.5));//0.5
     */
    static func scalar(_ start:CGFloat,_ end:CGFloat, _ progress:CGFloat) -> CGFloat {
        var a:CGFloat
        var b:CGFloat
        if(NumberAsserter.negative(start,0) || NumberAsserter.negative(end,0) && end < start){
            a = Swift.min(start, end)
            b = Swift.max(start, end)
        }else{
            a = Swift.max(start, end)
            b = Swift.min(start, end)
        }
        var scalar:CGFloat = (progress-b)/(a-b)
        if(scalar.isNaN) {scalar = 0}
        return scalar
    }
    /**
     * Returns the numeric distance between two values (always positive)
     * NOTE: doing Math.abs(b-a) instead of this method may be faster
     * EXAMPLE:
     * print(distance(-5,-2));//3
     * print(distance(-5,2));//7
     * print(distance(5,2));//3
     * print(distance(5,-2));//7
     * TODO: ⚠️️ Do a bulk test to see which is faster, then maybe deprecate this method
     */
    static func distance(_ a:CGFloat,_ b:CGFloat)->CGFloat {
        if(a.isNegative && b.isNegative) {return abs(Swift.min(a,b)) - abs(Swift.max(a,b))}
        else if(a.isPositive && b.isPositive) {return Swift.max(a, b) - Swift.min(a,b)}
        else {return abs(a) + abs(b)}/*if a is positive then b is negative and opposite*/
    }
    /**
     * Returns the difference between a and b (the returning number can be negative or posetive or zero)
     */
    static func relativeDifference(_ a:CGFloat,_ b:CGFloat)->CGFloat{
        return b-a
    }
    /**
     * Returns a constant looping number, really great when making looping slideshows
     * Return a number between PARAM: start number and the PARAM: end of the loop
     * PARAM: index: the current cursor of an infinite loop
     * PARAM: start: the start of the loop
     * PARAM: end: end of the loop
     * NOTE: take a look at IntParser.normalize(index,len) it may solve some cases simpler, and it could be extended into antoher method that does what this method does but way simpler and faster
     * NOTE: UintParser.normalize alos works well for uint values
     * EXAMPLE:
     * print("test "+(NumberParser.loop(20, 0, 10)));//0
     * print("test "+(NumberParser.loop(-2, -5, 10)));//8
     * TODO: Could be refactor to be simpler and more efficient
     * TODO: look at the while loop in Angle.normalize1() it could make this this class simpler by refactoring it the same way
     */
    static func loop(_ index:CGFloat, _ start:CGFloat, _ end:CGFloat) -> CGFloat{// :TODO: start,end,index is easier to understand
        var r:CGFloat
        var direction:CGFloat
        if(start < end) {direction = +1}/*Analyse the relationship between start and end*/
        else if(start > end) {direction = -1}
        else{fatalError("condition not supported")}
        if(index.isPositive){r = start - (index * direction)}//Analyse the index direction
        else{r = start + (index * direction)}
        let resultEndDist:CGFloat = CGFloatParser.distance(r, end)
        let startEndDist:CGFloat = CGFloatParser.distance(start,end)
        let remainder:CGFloat = resultEndDist %% startEndDist//Modulo returns the remainder
        var increment:CGFloat
        if(remainder == 0){increment = 0}
        else if(index > 0 && resultEndDist > startEndDist){increment = remainder}//Fix the check after && is ugly
        else {increment = (startEndDist - remainder)}
        r = start + (direction * increment)
        return r
    }
    /**
     * Returns an a array of interpoated numbers between min and max
     * EXAMPLE: CGFloatParser.interpolatedRange(0,  1,  3)//[0.0, 0.5, 1.0]
     */
     static func interpolatedRange(_ min:CGFloat ,_ max:CGFloat,_ length:Int)->[CGFloat]{
        var interpolatedRange:[CGFloat] = []
        if(length == 0){return interpolatedRange}//only populate the array with values if the length is more than zero
        let increaseBy:CGFloat = max/CGFloat(length-1)
        //Swift.print(value)
        var curVal:CGFloat = 0
        interpolatedRange.append(min)
        for _ in 1..<length-1{//was: for var i = 1; i < length-1; ++i{
            //Swift.print("i: " + "\(i)")
            curVal += increaseBy
            interpolatedRange.append(curVal)
        }
        interpolatedRange.append(max)
        return interpolatedRange
    }
    /**
     * NOTE: The example below calculates the arithmetic mean (also known as the average) for a list of numbers of any length
     * EXAMPLE: average([1, 2, 3, 4, 5])// returns 3.0, which is the arithmetic mean of these five numbers
     * EXAMPLE: average([3, 8.25, 18.75])// returns 10.0, which is the arithmetic mean of these three numbers
     */
    static func average(_ nums:[CGFloat]) -> CGFloat {
        return nums.count == 0 ? 0 : nums.reduce(0, +) / nums.count.cgFloat
        /*var total: CGFloat = 0
         for number in numbers {total += number}
         return total / CGFloat(numbers.count)*/
    }
}
