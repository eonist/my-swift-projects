import Foundation

enum WebColors: String, CaseIterable {
   case blue ,fuchsia ,black ,gray ,grey ,silver ,maroon ,red ,orange ,yellow ,olive ,green ,teal ,lime ,aqua ,navy ,purple ,white
}
extension WebColors {
   static var webColors: [String] { return self.allCases.map { $0.rawValue } }
}

// static var grey1:String = "grey1"
// static var grey2:String = "grey2"
// static var grey3:String = "grey3"
// static var grey4:String = "grey4"
// static var grey5:String = "grey5"
// static var grey6:String = "grey6"
// static var grey7:String = "grey7"
// static var grey8:String = "grey8"
// static var grey9:String = "grey9"
// static var white1:String = "white1"
// static var white2:String = "white2"
// static var white3:String = "white3"
// static var white4:String = "white4"
// static var white5:String = "white5"
// static var white6:String = "white6"
// static var white7:String = "white7"
// static var white8:String = "white8"
// static var white9:String = "white9"
