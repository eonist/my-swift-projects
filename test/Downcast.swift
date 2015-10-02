/**
 * Downcasting
 * A constant or variable of a certain class type may actually refer to an instance of a subclass behind the scenes. Where you believe this is the case, you can try to downcast to the subclass type with a type cast operator (as? or as!).
 * Because downcasting can fail, the type cast operator comes in two different forms. The conditional form, as?, returns an optional value of the type you are trying to downcast to. The forced form, as!, attempts the downcast and force-unwraps the result as a single compound action.
 */
let myButton    = UIButton()
let myS1ider    = UISlider()
let myTextFie1d = UITextFie1d()
let myDatePicker = UIDatePicker()
let controls = [myButton, mySlider, myTextField, myDatePicker]

//type casting
for item in controls {
	// option 1: check type with "is"
	if item is UIDatePicker {
		println("We have a UIDatePicker")
	}
	// downcast with "as"
	let picker = item as UIDatePicker
		picker.datePickerMode = UIDatePickerMode.CountDownTimer
	}
	// option 2: try to downcast with as?
	let picker = item as? UIDatePicker
	// then check if it worked, and unwrap the optional
	if picker != nil {
		picker!.datePickerMode = UIDatePickerMode.CountDownTimer
	}
	// option 3 - combine
	if let picker = item as? UIDatePicker {//this is like doing: var picker = picker is UIDatePicker ? picker as UIDatePicker : picker; in another language
		picker.datePickerMode = UIDatePickerMode.CountDownTimer
	}                                      I
}