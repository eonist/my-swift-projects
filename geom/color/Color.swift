import Foundation

class Color {
    static var GREY_1:uint = 0X111111;/*near black*/
    static var GREY_2:uint = 0X222222;
    static var GREY_3:uint = 0X333333;
    static var GREY_4:uint = 0X444444;
    static var GREY_5:uint = 0X555555;// :TODO: rename to GREY5
    static var GREY_6:uint = 0X666666;
    static var GREY_7:uint = 0X777777;
    static var GREY_8:uint = 0X888888;
    static var GREY_9:uint = 0X999999;/*ligther grey*/
    static var WHITE_1:uint = 0Xf9f9f9;/*near white*/
    static var WHITE_2:uint = 0Xf3f3f3;
    static var WHITE_3:uint = 0Xfafafa;
    static var WHITE_4:uint = 0Xf6f6f6;
    static var WHITE_5:uint = 0Xe6e6e6;
    static var WHITE_6:uint = 0Xeeeeee;
    static var WHITE_7:uint = 0Xe8e8e8;
    static var WHITE_8:uint = 0Xe2e2e2;
    static var WHITE_9:uint = 0XE4E4E4;/*ligth grey*/
    static var ALICEBLUE:uint = 0XF0F8FF;
    static var ANTIQUEWHITE:uint = 0XFAEBD7;
    static var AQUA:uint = 0X00FFFF;
    static var AQUAMARINE:uint = 0X7FFFD4;
    static var AZURE:uint = 0XF0FFFF;
    static var BEIGE:uint = 0XF5F5DC;
    static var BISQUE:uint = 0XFFE4C4;
    static var BLACK:uint = 0X000000;
    static var BLANCHEDALMOND:uint = 0XFFEBCD;
    static var BLUE:uint = 0X0000FF;
    static var BLUEVIOLET:uint = 0X8A2BE2;
    static var BROWN:uint = 0XA52A2A;
    static var BURLYWOOD:uint = 0XDEB887;
    static var CADETBLUE:uint = 0X5F9EA0;
    static var CHARTREUSE:uint = 0X7FFF00;
    static var CHOCOLATE:uint = 0XD2691E;
    static var CORAL:uint = 0XFF7F50;
    static var CORNFLOWERBLUE:uint = 0X6495ED;
    static var CORNSILK:uint = 0XFFF8DC;
    static var CRIMSON:uint = 0XDC143C;
    static var CYAN:uint = 0X00FFFF;
    static var DARKBLUE:uint = 0X00008B;
    static var DARKCYAN:uint = 0X008B8B;
    static var DARKGOLDENROD:uint = 0XB8860B;
    static var DARKGRAY:uint = 0XA9A9A9;
    static var DARKGREY:uint = 0XA9A9A9;
    static var DARKGREEN:uint = 0X006400;
    static var DARKKHAKI:uint = 0XBDB76B;
    static var DARKMAGENTA:uint = 0X8B008B;
    static var DARKOLIVEGREEN:uint = 0X556B2F;
    static var DARKORANGE:uint = 0XFF8C00;
    static var DARKORCHID:uint = 0X9932CC;
    static var DARKRED:uint = 0X8B0000;
    static var DARKSALMON:uint = 0XE9967A;
    static var DARKSEAGREEN:uint = 0X8FBC8F;
    static var DARKSLATEBLUE:uint = 0X483D8B;
    static var DARKSLATEGRAY:uint = 0X2F4F4F;
    static var DARKSLATEGREY:uint = 0X2F4F4F;
    static var DARKTURQUOISE:uint = 0X00CED1;
    static var DARKVIOLET:uint = 0X9400D3;
    static var DEEPPINK:uint = 0XFF1493;
    static var DEEPSKYBLUE:uint = 0X00BFFF;
    static var DIMGRAY:uint = 0X696969;
    static var DIMGREY:uint = 0X696969;
    static var DODGERBLUE:uint = 0X1E90FF;
    static var FIREBRICK:uint = 0XB22222;
    static var FLORALWHITE:uint = 0XFFFAF0;
    static var FORESTGREEN:uint = 0X228B22;
    static var FUCHSIA:uint = 0XFF00FF;
    static var GAINSBORO:uint = 0XDCDCDC;
    static var GHOSTWHITE:uint = 0XF8F8FF;
    static var GOLD:uint = 0XFFD700;
    static var GOLDENROD:uint = 0XDAA520;
    static var GRAY:uint = 0X808080;
    static var GREY:uint = 0X808080;
    static var GREEN:uint = 0X008000;
    static var GREENYELLOW:uint = 0XADFF2F;
    static var HONEYDEW:uint = 0XF0FFF0;
    static var HOTPINK:uint = 0XFF69B4;
    static var INDIANRED :uint = 0XCD5C5C;
    static var INDIGO :uint = 0X4B0082;
    static var IVORY:uint = 0XFFFFF0;
    static var KHAKI:uint = 0XF0E68C;
    static var LAVENDER:uint = 0XE6E6FA;
    static var LAVENDERBLUSH:uint = 0XFFF0F5;
    static var LAWNGREEN:uint = 0X7CFC00;
    static var LEMONCHIFFON:uint = 0XFFFACD;
    static var LIGHTBLUE:uint = 0XADD8E6;
    static var LIGHTCORAL:uint = 0XF08080;
    static var LIGHTCYAN:uint = 0XE0FFFF;
    static var LIGHTGOLDENRODYELLOW:uint = 0XFAFAD2;
    static var LIGHTGRAY:uint = 0XD3D3D3;
    static var LIGHTGREY:uint = 0XD3D3D3;
    static var LIGHTGREEN:uint = 0X90EE90;
    static var LIGHTPINK:uint = 0XFFB6C1;
    static var LIGHTSALMON:uint = 0XFFA07A;
    static var LIGHTSEAGREEN:uint = 0X20B2AA;
    static var LIGHTSKYBLUE:uint = 0X87CEFA;
    static var LIGHTSLATEGRAY:uint = 0X778899;
    static var LIGHTSLATEGREY:uint = 0X778899;
    static var LIGHTSTEELBLUE:uint = 0XB0C4DE;
    static var LIGHTYELLOW:uint = 0XFFFFE0;
    static var LIME:uint = 0X00FF00;
    static var LIMEGREEN:uint = 0X32CD32;
    static var LINEN:uint = 0XFAF0E6;
    static var MAGENTA:uint = 0XFF00FF;
    static var MAROON:uint = 0X800000;
    static var MEDIUMAQUAMARINE:uint = 0X66CDAA;
    static var MEDIUMBLUE:uint = 0X0000CD;
    static var MEDIUMORCHID:uint = 0XBA55D3;
    static var MEDIUMPURPLE:uint = 0X9370D8;
    static var MEDIUMSEAGREEN:uint = 0X3CB371;
    static var MEDIUMSLATEBLUE:uint = 0X7B68EE;
    static var MEDIUMSPRINGGREEN:uint = 0X00FA9A;
    static var MEDIUMTURQUOISE:uint = 0X48D1CC;
    static var MEDIUMVIOLETRED:uint = 0XC71585;
    static var MIDNIGHTBLUE:uint = 0X191970;
    static var MINTCREAM:uint = 0XF5FFFA;
    static var MISTYROSE:uint = 0XFFE4E1;
    static var MOCCASIN:uint = 0XFFE4B5;
    static var NAVAJOWHITE:uint = 0XFFDEAD;
    static var NAVY:uint = 0X000080;
    static var OLDLACE:uint = 0XFDF5E6;
    static var OLIVE:uint = 0X808000;
    static var OLIVEDRAB:uint = 0X6B8E23;
    static var ORANGE:uint = 0XFFA500;
    static var ORANGERED:uint = 0XFF4500;
    static var ORCHID:uint = 0XDA70D6;
    static var PALEGOLDENROD:uint = 0XEEE8AA;
    static var PALEGREEN:uint = 0X98FB98;
    static var PALETURQUOISE:uint = 0XAFEEEE;
    static var PALEVIOLETRED:uint = 0XD87093;
    static var PAPAYAWHIP:uint = 0XFFEFD5;
    static var PEACHPUFF:uint = 0XFFDAB9;
    static var PERU:uint = 0XCD853F;
    static var PINK:uint = 0XFFC0CB;
    static var PLUM:uint = 0XDDA0DD;
    static var POWDERBLUE:uint = 0XB0E0E6;
    static var PURPLE:uint = 0X800080;
    static var RED:uint = 0XFF0000;
    static var ROSYBROWN:uint = 0XBC8F8F;
    static var ROYALBLUE:uint = 0X4169E1;
    static var SADDLEBROWN:uint = 0X8B4513;
    static var SALMON:uint = 0XFA8072;
    static var SANDYBROWN:uint = 0XF4A460;
    static var SEAGREEN:uint = 0X2E8B57;
    static var SEASHELL:uint = 0XFFF5EE;
    static var SIENNA:uint = 0XA0522D;
    static var SILVER:uint = 0XC0C0C0;
    static var SKYBLUE:uint = 0X87CEEB;
    static var SLATEBLUE:uint = 0X6A5ACD;
    static var SLATEGRAY:uint = 0X708090;
    static var SLATEGREY:uint = 0X708090;
    static var SNOW:uint = 0XFFFAFA;
    static var SPRINGGREEN:uint = 0X00FF7F;
    static var STEELBLUE:uint = 0X4682B4;
    static var TAN:uint = 0XD2B48C;
    static var TEAL:uint = 0X008080;
    static var THISTLE:uint = 0XD8BFD8;
    static var TOMATO:uint = 0XFF6347;
    static var TURQUOISE:uint = 0X40E0D0;
    static var VIOLET:uint = 0XEE82EE;
    static var WHEAT:uint = 0XF5DEB3;
    static var WHITE:uint = 0XFFFFFF;
    static var WHITESMOKE:uint = 0XF5F5F5;
    static var YELLOW:uint = 0XFFFF00;
    static var YELLOWGREEN:uint =  0X9ACD3;
    /*Trivia*/
    static var BAUHAUS_COLOR_1:uint = 0x18346E;
    static var BAUHAUS_COLOR_2:uint = 0x191919;
    static var BAUHAUS_COLOR_3:uint = 0xCAA72A;
    static var BAUHAUS_COLOR_4:uint = 0x84251C;
    static var BAUHAUS_COLOR_5:uint = 0xE1E1E1;
    static var BAUHAUS_COLOR_S:Array = [BAUHAUS_COLOR_1,BAUHAUS_COLOR_2,BAUHAUS_COLOR_3,BAUHAUS_COLOR_4,BAUHAUS_COLOR_5];
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