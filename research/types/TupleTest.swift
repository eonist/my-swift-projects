import Foundation
func testing(){
    //tuples are almost like objects
    //good overview: https://www.weheartswift.com/tuples-enums/
    
   // Unnamed Tuples

   let tipAndTotal = (4.00, 25.19)
   let tipAndTotal2:(Double, Double) = (4.00, 25.19)
   tipAndTotal.0
   tipAndTotal.1

   let (theTipAmt, theTotal) = tipAndTotal
   theTipAmt
   theTotal


   //Named Tuples
   let tipAndTotalNamed = (tipAmt:4.00, total:25.19)
   tipAndTotalNamed.tipAmt
   tipAndTotalNamed.total
   let tipAndTotalNamed2:(tipAmt:Double, total:Double) = (4.00, 25.19)
    
    //Returning Tuples
   let total = 21.19
   let taxPct = 0.06
   let subtotal = total / (taxPct + 1)
   func calcTipWithTipPct(tipPct:Double) -> (tipAmt:Double, total:Double) {
     let tipAmt = subtotal * tipPct
     let finalTotal = total + tipAmt
     return (tipAmt, finalTotal)
   }
   calcTipWithTipPct(0.20)
   
   
   
   
   
   
   
       
    var someTuple = ("test",22,10.2,"abc")
    func testingTuples()->(String,Int){
        return ("test",55)
    }
    var res = testingTuples()
    print("your value: " + res.0 + " " + String(res.1))
    var (name,num) = testingTuples()
    print("your value:" + name + " and " + String(num))
    //named tuples. aka decomposing
    func testingTuples2()->(name:String,num:Int){//returns a tuple containing two values
        return ("test",55)
    }
    
    
    //print("your value:" + res.name + " " + String(res.num))
    
    //you cant use values that arent set
    let someVal:Int
    print("your value: \(someVal)")//throws error
    var someVal2:Int?//optional value the same as assigning = nil
    print("your value: \(someVal2)")//nil
    someVal2 = 3
    if someVal2 != nil {
        print("your value: \(someVal2!)")//forced unwrapping with !, you do this if you know the value isnt nil, even though it isnt assigned on init of the var
    }
    
    //nested tuples:
    //The value of the expression is set to the value obtained by evaluating the value. If the expression is a tuple, the value must be a tuple with the same number of elements. (Nested tuples are allowed.) Assignment is performed from each part of the value to the corresponding part of the expression. For example:
    
    let (a, _, (b, c)) = ("test", 9.45, (12, 3))
    // a is "test", b is 12, c is 3, and 9.45 is ignored
    print(b)
    print(c)
    print(a)
    
    //Toggle different tuple types
    // This url consists of host name.com and path /12345
    /*
    
    
    
    let urlComponents = componentsFromUrlString("http://name.com/12345;param?foo=1&baa=2#fragment")
    
    switch (urlComponents.host, urlComponents.path) {
    case let (.Some(host), .Some(path)):
        print("This url consists of host \(host) and path \(path)")
    case let (.Some(host), .None):
        print("This url only has a host \(host)")
    case let (.None, .Some(path)):
        print("This url only has path \(path). Make sure to add a host!")
    case let (.None, .None):
        print("This is not a url!")
    }
    */
}
