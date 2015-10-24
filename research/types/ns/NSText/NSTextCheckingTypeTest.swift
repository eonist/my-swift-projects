func test(){
	switch result.resultType {

                    case NSTextCheckingType.Link:
                        resultsText += "Link: \(result.URL)\n"

                    case NSTextCheckingType.Date:
                        resultsText += "Date: \(result.date)\n"

                    case NSTextCheckingType.PhoneNumber:
                        resultsText += "Phone Number: \(result.phoneNumber)"

                    case NSTextCheckingType.Address:
                        resultsText += "Address: \(result.addressComponents)”
						  default:
                        resultsText += "Other: \(result.description)\n"
	} 
}