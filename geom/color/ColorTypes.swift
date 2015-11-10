import Foundation

class ColorTypes{
    /**
     * Returns a color in hex
     * // :TODO: Sort alphabetically
     */
    class func color(colorType:String) -> UInt {
        var color:UInt;
        switch(colorType) {
        case "blue":
            color = Colors.BLUE;
            break;
        case "fuchsia":
            color = Colors.FUCHSIA;
            break;
        case "black":
            color = Colors.BLACK;
            break;
        case "white":
            color = Colors.WHITE;
            break;
        case "gray":
            color = Colors.GRAY;
            break;
        case "silver":
            color = Colors.SILVER;
            break;
        case "maroon":
            color = Colors.MAROON;
            break;
        case "red":
            color = Colors.RED;
            break;
        case "orange":
            color = Colors.ORANGE;
            break;
        case "yellow":
            color = Colors.YELLOW;
            break;
        case "olive":
            color = Colors.OLIVE;
            break;
        case "green":
            color = Colors.GREEN;
            break;
        case "teal":
            color = Colors.TEAL;
            break;
        case "lime":
            color = Colors.LIME;
            break;
        case "aqua":
            color = Colors.AQUA;
            break;
        case "navy":
            color = Colors.NAVY;
            break;
        case "purple":
            color = Colors.PURPLE;
            break;
        case "pink":
            color = Colors.PINK;
            break;
        case "grey":
            color = Colors.GREY;
            break;
        case "grey1":
            color = Colors.GREY_1;
            break;
        case "grey2":
            color = Colors.GREY_2;
            break;
        case "grey3":
            color = Colors.GREY_3;
            break;
        case "grey4":
            color = Colors.GREY_4;
            break;
        case "grey5":
            color = Colors.GREY_5;
            break;
        case "grey6":
            color = Colors.GREY_6;
            break;
        case "grey7":
            color = Colors.GREY_7;
            break;
        case "grey8":
            color = Colors.GREY_8;
            break;
        case "grey9":
            color = Colors.GREY_9;
            break;
        case "white1":
            color = Colors.WHITE_1;
            break;
        case "white2":
            color = Colors.WHITE_2;
            break;
        case "white3":
            color = Colors.WHITE_3;
            break;
        case "white4":
            color = Colors.WHITE_4;
            break;
        case "white5":
            color = Colors.WHITE_5;
            break;
        case "white6":
            color = Colors.WHITE_6;
            break;
        case "white7":
            color = Colors.WHITE_7;
            break;
        case "white8":
            color = Colors.WHITE_8;
            break;
        case "white9":
            color = Colors.WHITE_9;
            break;
        default:
            fatalError("COLORTYPE:" + colorType + " IS NOT SUPORTED YET")
            break;
        }
        return color;
    }
}