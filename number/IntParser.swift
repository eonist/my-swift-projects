class IntParser{
	/**
	 * 
	 */
	func kind(theInt:Int)->Int{
        switch theInt {
	        case 0:
	            return "Zero"
	        case let x where x > 0://<--where is a constraint, must be true
	            return "Positive"
	        default:
	            return "Negative"
	        }
	    }
	}
}