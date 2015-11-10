import Foundation

class Color {
    static var GREY_1:UInt = 0X111111;/*near black*/
    static var GREY_2:UInt = 0X222222;
    static var GREY_3:UInt = 0X333333;
    static var GREY_4:UInt = 0X444444;
    static var GREY_5:UInt = 0X555555;// :TODO: rename to GREY5
    static var GREY_6:UInt = 0X666666;
    static var GREY_7:UInt = 0X777777;
    static var GREY_8:UInt = 0X888888;
    static var GREY_9:UInt = 0X999999;/*ligther grey*/
    static var WHITE_1:UInt = 0Xf9f9f9;/*near white*/
    static var WHITE_2:UInt = 0Xf3f3f3;
    static var WHITE_3:UInt = 0Xfafafa;
    static var WHITE_4:UInt = 0Xf6f6f6;
    static var WHITE_5:UInt = 0Xe6e6e6;
    static var WHITE_6:UInt = 0Xeeeeee;
    static var WHITE_7:UInt = 0Xe8e8e8;
    static var WHITE_8:UInt = 0Xe2e2e2;
    static var WHITE_9:UInt = 0XE4E4E4;/*ligth grey*/
    static var ALICEBLUE:UInt = 0XF0F8FF;
    static var ANTIQUEWHITE:UInt = 0XFAEBD7;
    static var AQUA:UInt = 0X00FFFF;
    static var AQUAMARINE:UInt = 0X7FFFD4;
    static var AZURE:UInt = 0XF0FFFF;
    static var BEIGE:UInt = 0XF5F5DC;
    static var BISQUE:UInt = 0XFFE4C4;
    static var BLACK:UInt = 0X000000;
    static var BLANCHEDALMOND:UInt = 0XFFEBCD;
    static var BLUE:UInt = 0X0000FF;
    static var BLUEVIOLET:UInt = 0X8A2BE2;
    static var BROWN:UInt = 0XA52A2A;
    static var BURLYWOOD:UInt = 0XDEB887;
    static var CADETBLUE:UInt = 0X5F9EA0;
    static var CHARTREUSE:UInt = 0X7FFF00;
    static var CHOCOLATE:UInt = 0XD2691E;
    static var CORAL:UInt = 0XFF7F50;
    static var CORNFLOWERBLUE:UInt = 0X6495ED;
    static var CORNSILK:UInt = 0XFFF8DC;
    static var CRIMSON:UInt = 0XDC143C;
    static var CYAN:UInt = 0X00FFFF;
    static var DARKBLUE:UInt = 0X00008B;
    static var DARKCYAN:UInt = 0X008B8B;
    static var DARKGOLDENROD:UInt = 0XB8860B;
    static var DARKGRAY:UInt = 0XA9A9A9;
    static var DARKGREY:UInt = 0XA9A9A9;
    static var DARKGREEN:UInt = 0X006400;
    static var DARKKHAKI:UInt = 0XBDB76B;
    static var DARKMAGENTA:UInt = 0X8B008B;
    static var DARKOLIVEGREEN:UInt = 0X556B2F;
    static var DARKORANGE:UInt = 0XFF8C00;
    static var DARKORCHID:UInt = 0X9932CC;
    static var DARKRED:UInt = 0X8B0000;
    static var DARKSALMON:UInt = 0XE9967A;
    static var DARKSEAGREEN:UInt = 0X8FBC8F;
    static var DARKSLATEBLUE:UInt = 0X483D8B;
    static var DARKSLATEGRAY:UInt = 0X2F4F4F;
    static var DARKSLATEGREY:UInt = 0X2F4F4F;
    static var DARKTURQUOISE:UInt = 0X00CED1;
    static var DARKVIOLET:UInt = 0X9400D3;
    static var DEEPPINK:UInt = 0XFF1493;
    static var DEEPSKYBLUE:UInt = 0X00BFFF;
    static var DIMGRAY:UInt = 0X696969;
    static var DIMGREY:UInt = 0X696969;
    static var DODGERBLUE:UInt = 0X1E90FF;
    static var FIREBRICK:UInt = 0XB22222;
    static var FLORALWHITE:UInt = 0XFFFAF0;
    static var FORESTGREEN:UInt = 0X228B22;
    static var FUCHSIA:UInt = 0XFF00FF;
    static var GAINSBORO:UInt = 0XDCDCDC;
    static var GHOSTWHITE:UInt = 0XF8F8FF;
    static var GOLD:UInt = 0XFFD700;
    static var GOLDENROD:UInt = 0XDAA520;
    static var GRAY:UInt = 0X808080;
    static var GREY:UInt = 0X808080;
    static var GREEN:UInt = 0X008000;
    static var GREENYELLOW:UInt = 0XADFF2F;
    static var HONEYDEW:UInt = 0XF0FFF0;
    static var HOTPINK:UInt = 0XFF69B4;
    static var INDIANRED :UInt = 0XCD5C5C;
    static var INDIGO :UInt = 0X4B0082;
    static var IVORY:UInt = 0XFFFFF0;
    static var KHAKI:UInt = 0XF0E68C;
    static var LAVENDER:UInt = 0XE6E6FA;
    static var LAVENDERBLUSH:UInt = 0XFFF0F5;
    static var LAWNGREEN:UInt = 0X7CFC00;
    static var LEMONCHIFFON:UInt = 0XFFFACD;
    static var LIGHTBLUE:UInt = 0XADD8E6;
    static var LIGHTCORAL:UInt = 0XF08080;
    static var LIGHTCYAN:UInt = 0XE0FFFF;
    static var LIGHTGOLDENRODYELLOW:UInt = 0XFAFAD2;
    static var LIGHTGRAY:UInt = 0XD3D3D3;
    static var LIGHTGREY:UInt = 0XD3D3D3;
    static var LIGHTGREEN:UInt = 0X90EE90;
    static var LIGHTPINK:UInt = 0XFFB6C1;
    static var LIGHTSALMON:UInt = 0XFFA07A;
    static var LIGHTSEAGREEN:UInt = 0X20B2AA;
    static var LIGHTSKYBLUE:UInt = 0X87CEFA;
    static var LIGHTSLATEGRAY:UInt = 0X778899;
    static var LIGHTSLATEGREY:UInt = 0X778899;
    static var LIGHTSTEELBLUE:UInt = 0XB0C4DE;
    static var LIGHTYELLOW:UInt = 0XFFFFE0;
    static var LIME:UInt = 0X00FF00;
    static var LIMEGREEN:UInt = 0X32CD32;
    static var LINEN:UInt = 0XFAF0E6;
    static var MAGENTA:UInt = 0XFF00FF;
    static var MAROON:UInt = 0X800000;
    static var MEDIUMAQUAMARINE:UInt = 0X66CDAA;
    static var MEDIUMBLUE:UInt = 0X0000CD;
    static var MEDIUMORCHID:UInt = 0XBA55D3;
    static var MEDIUMPURPLE:UInt = 0X9370D8;
    static var MEDIUMSEAGREEN:UInt = 0X3CB371;
    static var MEDIUMSLATEBLUE:UInt = 0X7B68EE;
    static var MEDIUMSPRINGGREEN:UInt = 0X00FA9A;
    static var MEDIUMTURQUOISE:UInt = 0X48D1CC;
    static var MEDIUMVIOLETRED:UInt = 0XC71585;
    static var MIDNIGHTBLUE:UInt = 0X191970;
    static var MINTCREAM:UInt = 0XF5FFFA;
    static var MISTYROSE:UInt = 0XFFE4E1;
    static var MOCCASIN:UInt = 0XFFE4B5;
    static var NAVAJOWHITE:UInt = 0XFFDEAD;
    static var NAVY:UInt = 0X000080;
    static var OLDLACE:UInt = 0XFDF5E6;
    static var OLIVE:UInt = 0X808000;
    static var OLIVEDRAB:UInt = 0X6B8E23;
    static var ORANGE:UInt = 0XFFA500;
    static var ORANGERED:UInt = 0XFF4500;
    static var ORCHID:UInt = 0XDA70D6;
    static var PALEGOLDENROD:UInt = 0XEEE8AA;
    static var PALEGREEN:UInt = 0X98FB98;
    static var PALETURQUOISE:UInt = 0XAFEEEE;
    static var PALEVIOLETRED:UInt = 0XD87093;
    static var PAPAYAWHIP:UInt = 0XFFEFD5;
    static var PEACHPUFF:UInt = 0XFFDAB9;
    static var PERU:UInt = 0XCD853F;
    static var PINK:UInt = 0XFFC0CB;
    static var PLUM:UInt = 0XDDA0DD;
    static var POWDERBLUE:UInt = 0XB0E0E6;
    static var PURPLE:UInt = 0X800080;
    static var RED:UInt = 0XFF0000;
    static var ROSYBROWN:UInt = 0XBC8F8F;
    static var ROYALBLUE:UInt = 0X4169E1;
    static var SADDLEBROWN:UInt = 0X8B4513;
    static var SALMON:UInt = 0XFA8072;
    static var SANDYBROWN:UInt = 0XF4A460;
    static var SEAGREEN:UInt = 0X2E8B57;
    static var SEASHELL:UInt = 0XFFF5EE;
    static var SIENNA:UInt = 0XA0522D;
    static var SILVER:UInt = 0XC0C0C0;
    static var SKYBLUE:UInt = 0X87CEEB;
    static var SLATEBLUE:UInt = 0X6A5ACD;
    static var SLATEGRAY:UInt = 0X708090;
    static var SLATEGREY:UInt = 0X708090;
    static var SNOW:UInt = 0XFFFAFA;
    static var SPRINGGREEN:UInt = 0X00FF7F;
    static var STEELBLUE:UInt = 0X4682B4;
    static var TAN:UInt = 0XD2B48C;
    static var TEAL:UInt = 0X008080;
    static var THISTLE:UInt = 0XD8BFD8;
    static var TOMATO:UInt = 0XFF6347;
    static var TURQUOISE:UInt = 0X40E0D0;
    static var VIOLET:UInt = 0XEE82EE;
    static var WHEAT:UInt = 0XF5DEB3;
    static var WHITE:UInt = 0XFFFFFF;
    static var WHITESMOKE:UInt = 0XF5F5F5;
    static var YELLOW:UInt = 0XFFFF00;
    static var YELLOWGREEN:UInt =  0X9ACD3;
    /*Trivia*/
    static var BAUHAUS_COLOR_1:UInt = 0x18346E;
    static var BAUHAUS_COLOR_2:UInt = 0x191919;
    static var BAUHAUS_COLOR_3:UInt = 0xCAA72A;
    static var BAUHAUS_COLOR_4:UInt = 0x84251C;
    static var BAUHAUS_COLOR_5:UInt = 0xE1E1E1;
    static var BAUHAUS_COLOR_S:Array<UInt> = [BAUHAUS_COLOR_1,BAUHAUS_COLOR_2,BAUHAUS_COLOR_3,BAUHAUS_COLOR_4,BAUHAUS_COLOR_5];
}
/*

FANCY IOS8 Colors:
static var red:String = "FF3B30"
static var orange:String = "FF9500"
static var yellow:String = "FFCC00"
static var green:String = "4CD964"
static var lightBlue:String = "34AADC"
static var darkBlue:String = "007AFF"
static var purple:String = "5856D6"
static var pink:String = "FF2D55"
static var darkGray:String = "8E8E93"
static var lightGray:String = "C7C7CC"

Gradients:



#pragma mark - Gradient Colors

+ (instancetype)iOS8redGradientStartColor;
{
return [UIColor colorWithHexString:@"FF5E3A"];
}

+ (instancetype)iOS8redGradientEndColor;
{
return [UIColor colorWithHexString:@"FF2A68"];
}

+ (instancetype)iOS8orangeGradientStartColor;
{
return [UIColor colorWithHexString:@"FF9500"];
}

+ (instancetype)iOS8orangeGradientEndColor;
{
return [UIColor colorWithHexString:@"FF5E3A"];
}

+ (instancetype)iOS8yellowGradientStartColor;
{
return [UIColor colorWithHexString:@"FFDB4C"];
}

+ (instancetype)iOS8yellowGradientEndColor;
{
return [UIColor colorWithHexString:@"FFCD02"];
}

+ (instancetype)iOS8greenGradientStartColor;
{
return [UIColor colorWithHexString:@"87FC70"];
}

+ (instancetype)iOS8greenGradientEndColor;
{
return [UIColor colorWithHexString:@"0BD318"];
}

+ (instancetype)iOS8tealGradientStartColor;
{
return [UIColor colorWithHexString:@"52EDC7"];
}

+ (instancetype)iOS8tealGradientEndColor;
{
return [UIColor colorWithHexString:@"5AC8FB"];
}

+ (instancetype)iOS8blueGradientStartColor;
{
return [UIColor colorWithHexString:@"1AD6FD"];
}

+ (instancetype)iOS8blueGradientEndColor;
{
return [UIColor colorWithHexString:@"1D62F0"];
}

+ (instancetype)iOS8violetGradientStartColor;
{
return [UIColor colorWithHexString:@"C644FC"];
}

+ (instancetype)iOS8violetGradientEndColor;
{
return [UIColor colorWithHexString:@"5856D6"];
}

+ (instancetype)iOS8magentaGradientStartColor;
{
return [UIColor colorWithHexString:@"EF4DB6"];
}

+ (instancetype)iOS8magentaGradientEndColor;
{
return [UIColor colorWithHexString:@"C643FC"];
}

+ (instancetype)iOS8blackGradientStartColor;
{
return [UIColor colorWithHexString:@"4A4A4A"];
}

+ (instancetype)iOS8blackGradientEndColor;
{
return [UIColor colorWithHexString:@"2B2B2B"];
}

+ (instancetype)iOS8silverGradientStartColor;
{
return [UIColor colorWithHexString:@"DBDDDE"];
}

+ (instancetype)iOS8silverGradientEndColor;
{
return [UIColor colorWithHexString:@"898C90"];
}
*/