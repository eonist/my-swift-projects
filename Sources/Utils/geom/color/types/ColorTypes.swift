import Foundation

class ColorTypes{
    /**
     * Returns a color in hex
     * TODO: ⚠️️ Sort alphabetically
     * TODO: ⚠️️ you dont need the break in swift only on the default, should return optional
     */
    class func color(_ colorType:String) -> UInt {
        let color:UInt = {
           switch colorType {
           case "blue":return Colors.BLUE
           case "fuchsia":return Colors.FUCHSIA
           case "black":return Colors.BLACK
           case "white":return Colors.WHITE
           case "gray":return Colors.GRAY
           case "silver":return Colors.SILVER
           case "maroon":return Colors.MAROON
           case "red":return Colors.RED
           case "orange":return Colors.ORANGE
           case "yellow":return Colors.YELLOW
           case "olive":return Colors.OLIVE
           case "green":return Colors.GREEN
           case "teal":return Colors.TEAL
           case "lime":return Colors.LIME
           case "aqua":return Colors.AQUA
           case "navy":return Colors.NAVY
           case "purple":return Colors.PURPLE
           case "pink":return Colors.PINK
           case "grey":return Colors.GREY
           case "grey1":return Colors.GREY_1
           case "grey2":return Colors.GREY_2
           case "grey3":return Colors.GREY_3
           case "grey4":return Colors.GREY_4
           case "grey5":return Colors.GREY_5
           case "grey6":return Colors.GREY_6
           case "grey7":return Colors.GREY_7
           case "grey8":return Colors.GREY_8
           case "grey9":return Colors.GREY_9
           case "white1":return Colors.WHITE_1
           case "white2":return Colors.WHITE_2
           case "white3":return Colors.WHITE_3
           case "white4":return Colors.WHITE_4
           case "white5":return Colors.WHITE_5
           case "white6":return Colors.WHITE_6
           case "white7":return Colors.WHITE_7
           case "white8":return Colors.WHITE_8
           case "white9": return Colors.WHITE_9
           default:fatalError("COLORTYPE: " + colorType + " IS NOT SUPORTED YET")
          }
        }()
    }
}
