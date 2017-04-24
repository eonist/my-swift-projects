import Cocoa
/**
 * // :TODO: WHITE1,WHITE2, BLACK2, BLACK3 etc
 * // :TODO: add CYAN,MAGENTA,KEY,YELLOW CMYK
 * TODO: ⚠️️ make these consts lowercase
 */
class Colors {
    static var GREY_1:UInt = 0x111111/*near black*/
    static var GREY_2:UInt = 0x222222
    static var GREY_3:UInt = 0x333333
    static var GREY_4:UInt = 0x444444
    static var GREY_5:UInt = 0x555555// :TODO: rename to GREY5
    static var GREY_6:UInt = 0x666666
    static var GREY_7:UInt = 0x777777
    static var GREY_8:UInt = 0x888888
    static var GREY_9:UInt = 0x999999/*ligther grey*/
    static var WHITE_1:UInt = 0xf9f9f9/*near white*/
    static var WHITE_2:UInt = 0xf3f3f3
    static var WHITE_3:UInt = 0xfafafa
    static var WHITE_4:UInt = 0xf6f6f6
    static var WHITE_5:UInt = 0xe6e6e6
    static var WHITE_6:UInt = 0xeeeeee
    static var WHITE_7:UInt = 0xe8e8e8
    static var WHITE_8:UInt = 0xe2e2e2
    static var WHITE_9:UInt = 0xE4E4E4/*ligth grey*/
    static var ALICEBLUE:UInt = 0xF0F8FF
    static var ANTIQUEWHITE:UInt = 0xFAEBD7
    static var AQUA:UInt = 0x00FFFF
    static var AQUAMARINE:UInt = 0x7FFFD4
    static var AZURE:UInt = 0xF0FFFF
    static var BEIGE:UInt = 0xF5F5DC
    static var BISQUE:UInt = 0xFFE4C4
    static var BLACK:UInt = 0x000000
    static var BLANCHEDALMOND:UInt = 0xFFEBCD
    static var BLUE:UInt = 0x0000FF
    static var BLUEVIOLET:UInt = 0x8A2BE2
    static var BROWN:UInt = 0xA52A2A
    static var BURLYWOOD:UInt = 0xDEB887
    static var CADETBLUE:UInt = 0x5F9EA0
    static var CHARTREUSE:UInt = 0x7FFF00
    static var CHOCOLATE:UInt = 0xD2691E
    static var CORAL:UInt = 0xFF7F50
    static var CORNFLOWERBLUE:UInt = 0x6495ED
    static var CORNSILK:UInt = 0xFFF8DC
    static var CRIMSON:UInt = 0xDC143C
    static var CYAN:UInt = 0x00FFFF
    static var DARKBLUE:UInt = 0x00008B
    static var DARKCYAN:UInt = 0x008B8B
    static var DARKGOLDENROD:UInt = 0xB8860B
    static var DARKGRAY:UInt = 0xA9A9A9
    static var DARKGREY:UInt = 0xA9A9A9
    static var DARKGREEN:UInt = 0x006400
    static var DARKKHAKI:UInt = 0xBDB76B
    static var DARKMAGENTA:UInt = 0x8B008B
    static var DARKOLIVEGREEN:UInt = 0x556B2F
    static var DARKORANGE:UInt = 0xFF8C00
    static var DARKORCHID:UInt = 0x9932CC
    static var DARKRED:UInt = 0x8B0000
    static var DARKSALMON:UInt = 0xE9967A
    static var DARKSEAGREEN:UInt = 0x8FBC8F
    static var DARKSLATEBLUE:UInt = 0x483D8B
    static var DARKSLATEGRAY:UInt = 0x2F4F4F
    static var DARKSLATEGREY:UInt = 0x2F4F4F
    static var DARKTURQUOISE:UInt = 0x00CED1
    static var DARKVIOLET:UInt = 0x9400D3
    static var DEEPPINK:UInt = 0xFF1493
    static var DEEPSKYBLUE:UInt = 0x00BFFF
    static var DIMGRAY:UInt = 0x696969
    static var DIMGREY:UInt = 0x696969
    static var DODGERBLUE:UInt = 0x1E90FF
    static var FIREBRICK:UInt = 0xB22222
    static var FLORALWHITE:UInt = 0xFFFAF0
    static var FORESTGREEN:UInt = 0x228B22
    static var FUCHSIA:UInt = 0xFF00FF
    static var GAINSBORO:UInt = 0xDCDCDC
    static var GHOSTWHITE:UInt = 0xF8F8FF
    static var GOLD:UInt = 0xFFD700
    static var GOLDENROD:UInt = 0xDAA520
    static var GRAY:UInt = 0x808080
    static var GREY:UInt = 0x808080
    static var GREEN:UInt = 0x008000
    static var GREENYELLOW:UInt = 0xADFF2F
    static var HONEYDEW:UInt = 0xF0FFF0
    static var HOTPINK:UInt = 0xFF69B4
    static var INDIANRED :UInt = 0xCD5C5C
    static var INDIGO :UInt = 0x4B0082
    static var IVORY:UInt = 0xFFFFF0
    static var KHAKI:UInt = 0xF0E68C
    static var LAVENDER:UInt = 0xE6E6FA
    static var LAVENDERBLUSH:UInt = 0xFFF0F5
    static var LAWNGREEN:UInt = 0x7CFC00
    static var LEMONCHIFFON:UInt = 0xFFFACD
    static var LIGHTBLUE:UInt = 0xADD8E6
    static var LIGHTCORAL:UInt = 0xF08080
    static var LIGHTCYAN:UInt = 0xE0FFFF
    static var LIGHTGOLDENRODYELLOW:UInt = 0xFAFAD2
    static var LIGHTGRAY:UInt = 0xD3D3D3
    static var LIGHTGREY:UInt = 0xD3D3D3
    static var LIGHTGREEN:UInt = 0x90EE90
    static var LIGHTPINK:UInt = 0xFFB6C1
    static var LIGHTSALMON:UInt = 0xFFA07A
    static var LIGHTSEAGREEN:UInt = 0x20B2AA
    static var LIGHTSKYBLUE:UInt = 0x87CEFA
    static var LIGHTSLATEGRAY:UInt = 0x778899
    static var LIGHTSLATEGREY:UInt = 0x778899
    static var LIGHTSTEELBLUE:UInt = 0xB0C4DE
    static var LIGHTYELLOW:UInt = 0xFFFFE0
    static var LIME:UInt = 0x00FF00
    static var LIMEGREEN:UInt = 0x32CD32
    static var LINEN:UInt = 0xFAF0E6
    static var MAGENTA:UInt = 0xFF00FF
    static var MAROON:UInt = 0x800000
    static var MEDIUMAQUAMARINE:UInt = 0x66CDAA
    static var MEDIUMBLUE:UInt = 0x0000CD
    static var MEDIUMORCHID:UInt = 0xBA55D3
    static var MEDIUMPURPLE:UInt = 0x9370D8
    static var MEDIUMSEAGREEN:UInt = 0x3CB371
    static var MEDIUMSLATEBLUE:UInt = 0x7B68EE
    static var MEDIUMSPRINGGREEN:UInt = 0x00FA9A
    static var MEDIUMTURQUOISE:UInt = 0x48D1CC
    static var MEDIUMVIOLETRED:UInt = 0xC71585
    static var MIDNIGHTBLUE:UInt = 0x191970
    static var MINTCREAM:UInt = 0xF5FFFA
    static var MISTYROSE:UInt = 0xFFE4E1
    static var MOCCASIN:UInt = 0xFFE4B5
    static var NAVAJOWHITE:UInt = 0xFFDEAD
    static var NAVY:UInt = 0x000080
    static var OLDLACE:UInt = 0xFDF5E6
    static var OLIVE:UInt = 0x808000
    static var OLIVEDRAB:UInt = 0x6B8E23
    static var ORANGE:UInt = 0xFFA500
    static var ORANGERED:UInt = 0xFF4500
    static var ORCHID:UInt = 0xDA70D6
    static var PALEGOLDENROD:UInt = 0xEEE8AA
    static var PALEGREEN:UInt = 0x98FB98
    static var PALETURQUOISE:UInt = 0xAFEEEE
    static var PALEVIOLETRED:UInt = 0xD87093
    static var PAPAYAWHIP:UInt = 0xFFEFD5
    static var PEACHPUFF:UInt = 0xFFDAB9
    static var PERU:UInt = 0xCD853F
    static var PINK:UInt = 0xFFC0CB
    static var PLUM:UInt = 0xDDA0DD
    static var POWDERBLUE:UInt = 0xB0E0E6
    static var PURPLE:UInt = 0x800080
    static var RED:UInt = 0xFF0000
    static var ROSYBROWN:UInt = 0xBC8F8F
    static var ROYALBLUE:UInt = 0x4169E1
    static var SADDLEBROWN:UInt = 0x8B4513
    static var SALMON:UInt = 0xFA8072
    static var SANDYBROWN:UInt = 0xF4A460
    static var SEAGREEN:UInt = 0x2E8B57
    static var SEASHELL:UInt = 0xFFF5EE
    static var SIENNA:UInt = 0xA0522D
    static var SILVER:UInt = 0xC0C0C0
    static var SKYBLUE:UInt = 0x87CEEB
    static var SLATEBLUE:UInt = 0x6A5ACD
    static var SLATEGRAY:UInt = 0x708090
    static var SLATEGREY:UInt = 0x708090
    static var SNOW:UInt = 0xFFFAFA
    static var SPRINGGREEN:UInt = 0x00FF7F
    static var STEELBLUE:UInt = 0x4682B4
    static var TAN:UInt = 0xD2B48C
    static var TEAL:UInt = 0x008080
    static var THISTLE:UInt = 0xD8BFD8
    static var TOMATO:UInt = 0xFF6347
    static var TURQUOISE:UInt = 0x40E0D0
    static var VIOLET:UInt = 0xEE82EE
    static var WHEAT:UInt = 0xF5DEB3
    static var WHITE:UInt = 0xFFFFFF
    static var WHITESMOKE:UInt = 0xF5F5F5
    static var YELLOW:UInt = 0xFFFF00
    static var YELLOWGREEN:UInt = 0x9ACD3
    /*Trivia*/
    static var BAUHAUS_COLOR_1:UInt = 0x18346E
    static var BAUHAUS_COLOR_2:UInt = 0x191919
    static var BAUHAUS_COLOR_3:UInt = 0xCAA72A
    static var BAUHAUS_COLOR_4:UInt = 0x84251C
    static var BAUHAUS_COLOR_5:UInt = 0xE1E1E1
    static var BAUHAUS_COLOR_S:Array<UInt> = [BAUHAUS_COLOR_1,BAUHAUS_COLOR_2,BAUHAUS_COLOR_3,BAUHAUS_COLOR_4,BAUHAUS_COLOR_5]
}
/*FANCY IOS Colors - hex colors:*/
extension Colors{
    static func red()->UInt{return 0xFF3B30}
    static func orange()->UInt{return 0xFF9500}
    static func yellow()->UInt{return 0xFFCC00}
    static func green()->UInt{return 0x4CD964}
    static func lightBlue()->UInt{return 0x34AADC}
    static func darkBlue()->UInt{return 0x007AFF}
    static func purple()->UInt{return 0x5856D6}
    static func pink()->UInt{return 0xFF2D55}
    static func darkGray()->UInt{return 0x8E8E93}
    static func lightGray()->UInt{return 0xC7C7CC}
    /*iOS colors*/
    static func paleBlue()->UInt{return 0xD1EEFC}
    static func paleGreen()->UInt{return 0xE0F8D8}
    static func lightPink()->UInt{return 0xFF4981}
    static func palePink()->UInt{return 0xFFD3E0}
    static func paleGray()->UInt{return 0xF7F7F7}
    static func orangeRed()->UInt{return 0xFF1300}
    static func redOrange()->UInt{return 0xFF3A2D}
    static func lightBlack()->UInt{return 0x1F1F21}
    static func gray()->UInt{return 0xBDBEC2}
}
/*FANCY IOS Colors - NSColor:*/
extension Colors{
    static func red()->NSColor{return NSColorParser.nsColor(Colors.red())}
    static func orange()->NSColor{return NSColorParser.nsColor(Colors.orange())}
    static func yellow()->NSColor{return NSColorParser.nsColor(Colors.yellow())}
    static func green()->NSColor{return NSColorParser.nsColor(Colors.green())}
    static func lightBlue()->NSColor{return NSColorParser.nsColor(Colors.lightBlue())}
    static func darkBlue()->NSColor{return NSColorParser.nsColor(Colors.darkBlue())}
    static func purple()->NSColor{return NSColorParser.nsColor(Colors.purple())}
    static func pink()->NSColor{return NSColorParser.nsColor(Colors.pink())}
    static func darkGray()->NSColor{return NSColorParser.nsColor(Colors.darkGray())}
    static func lightGray()->NSColor{return NSColorParser.nsColor(Colors.lightGray())}
    
    static func fancyColors() -> Array<(name:String,color:NSColor)> {return [("red",red()),("orange",orange()),("yellow",yellow()),("green",green()),("lightBlue",lightBlue()),("darkBlue",darkBlue()),("purple",purple()),("pink",pink()),("darkGray",darkGray()),("lightGray",lightGray())]}//,,,
}
