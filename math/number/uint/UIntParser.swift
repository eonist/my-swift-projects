import Foundation

class UIntParser {
    /**
     * Adds a zero infront of a number
     * // :TODO: Add more advance features to this function, when you have time!
     */
    class func digit(n:UInt,numOfDigits:Int)->String{
        
        //continue here: complete this method to also support 3 digits, and continue with the nsColorToHexColor code
        
        //return n < 10 ? "0"+aNr : String(aNr);
        
        
        
        if(n < 10){//0-9
            return "0" * numOfDigits + String(n)
        }else if(n >= 10 && n < 100){//10-99
            return prefix + String(n)
        }else{
            return String(n)
        }
    }
}
