import Foundation

class ColorTypes{
    /**
     * Returns a color in hex
     * TODO: Sort alphabetically
     * TODO: you dont need the break in swift only on the default
     */
    class func color(_ colorType:String) -> UInt {
        var color:UInt
        switch(colorType) {
            case "blue":
                color = Colors.BLUE
            case "fuchsia":
                color = Colors.FUCHSIA
            case "black":
                color = Colors.BLACK
            case "white":
                color = Colors.WHITE
            case "gray":
                color = Colors.GRAY
            case "silver":
                color = Colors.SILVER
            case "maroon":
                color = Colors.MAROON
            case "red":
                color = Colors.RED
            case "orange":
                color = Colors.ORANGE
            case "yellow":
                color = Colors.YELLOW
            case "olive":
                color = Colors.OLIVE
            case "green":
                color = Colors.GREEN
            case "teal":
                color = Colors.TEAL
            case "lime":
                color = Colors.LIME
            case "aqua":
                color = Colors.AQUA
            case "navy":
                color = Colors.NAVY
            case "purple":
                color = Colors.PURPLE
            case "pink":
                color = Colors.PINK
            case "grey":
                color = Colors.GREY
            case "grey1":
                color = Colors.GREY_1
            case "grey2":
                color = Colors.GREY_2
            case "grey3":
                color = Colors.GREY_3
            case "grey4":
                color = Colors.GREY_4
            case "grey5":
                color = Colors.GREY_5
            case "grey6":
                color = Colors.GREY_6
            case "grey7":
                color = Colors.GREY_7
            case "grey8":
                color = Colors.GREY_8
            case "grey9":
                color = Colors.GREY_9
            case "white1":
                color = Colors.WHITE_1
            case "white2":
                color = Colors.WHITE_2
            case "white3":
                color = Colors.WHITE_3
            case "white4":
                color = Colors.WHITE_4
            case "white5":
                color = Colors.WHITE_5
            case "white6":
                color = Colors.WHITE_6
            case "white7":
                color = Colors.WHITE_7
            case "white8":
                color = Colors.WHITE_8
            case "white9":
                color = Colors.WHITE_9
            default:
                fatalError("COLORTYPE: " + colorType + " IS NOT SUPORTED YET")
        }
        return color
    }
}
