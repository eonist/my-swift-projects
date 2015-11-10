import Foundation

class ColorTypes{
    class func color(colorType:String) -> UInt {
        var color:uint;
        switch(colorType) {
        case "blue":
            color = Color.BLUE;
            break;
        case "fuchsia":
            color = Color.FUCHSIA;
            break;
        case "black":
            color = Color.BLACK;
            break;
        case "white":
            color = Color.WHITE;
            break;
        case "gray":
            color = Color.GRAY;
            break;
        case "silver":
            color = Color.SILVER;
            break;
        case "maroon":
            color = Color.MAROON;
            break;
        case "red":
            color = Color.RED;
            break;
        case "orange":
            color = Color.ORANGE;
            break;
        case "yellow":
            color = Color.YELLOW;
            break;
        case "olive":
            color = Color.OLIVE;
            break;
        case "green":
            color = Color.GREEN;
            break;
        case "teal":
            color = Color.TEAL;
            break;
        case "lime":
            color = Color.LIME;
            break;
        case "aqua":
            color = Color.AQUA;
            break;
        case "navy":
            color = Color.NAVY;
            break;
        case "purple":
            color = Color.PURPLE;
            break;
        case "pink":
            color = Color.PINK;
            break;
        case "grey":
            color = Color.GREY;
            break;
        case "grey1":
            color = Color.GREY_1;
            break;
        case "grey2":
            color = Color.GREY_2;
            break;
        case "grey3":
            color = Color.GREY_3;
            break;
        case "grey4":
            color = Color.GREY_4;
            break;
        case "grey5":
            color = Color.GREY_5;
            break;
        case "grey6":
            color = Color.GREY_6;
            break;
        case "grey7":
            color = Color.GREY_7;
            break;
        case "grey8":
            color = Color.GREY_8;
            break;
        case "grey9":
            color = Color.GREY_9;
            break;
        case "white1":
            color = Color.WHITE_1;
            break;
        case "white2":
            color = Color.WHITE_2;
            break;
        case "white3":
            color = Color.WHITE_3;
            break;
        case "white4":
            color = Color.WHITE_4;
            break;
        case "white5":
            color = Color.WHITE_5;
            break;
        case "white6":
            color = Color.WHITE_6;
            break;
        case "white7":
            color = Color.WHITE_7;
            break;
        case "white8":
            color = Color.WHITE_8;
            break;
        case "white9":
            color = Color.WHITE_9;
            break;
        default:
            throw new Error("COLORTYPE:" + colorType + " IS NOT SUPORTED YET");
            break;
        }
        return color;
    }
}