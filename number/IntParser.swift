class IntParser{
	/**
	 * 
	 */
	func kind(){
		enum Kind {
	        case , Zero, Positive
	    }
	    var kind: Kind {
	        switch self {
	        case 0:
	            return "Zero"
	        case let x where x > 0:
	            return "Positive"
	        default:
	            return "Negative"
	        }
	    }
	}
}