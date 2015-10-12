//https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/EventOverview/HandlingMouseEvents/HandlingMouseEvents.html

/*

theEvent {
    [self setFrameColor:[NSColor redColor]];
    [self setNeedsDisplay:YES];
}
 
- (void)mouseUp:(NSEvent *)theEvent {
    [self setFrameColor:[NSColor greenColor]];
    [self setNeedsDisplay:YES];
}
 
- (void)drawRect:(NSRect)rect {
    [[self frameColor] set];
    NSRectFill(rect);
}

*/
/*
NSLeftMouseUp

NSRightMouseUp

NSOtherMouseUp

NSLeftMouseDown

NSRightMouseDown

NSOtherMouseDown

NSKeyDown
*/

//code for clicking outside a popup: http://swiftrien.blogspot.no/2015/05/mouse-up-mouse-down-and-popup-menus.html