/*
Using Quartz Shadings in Cocoa
Because the NSGradient class is available only in OS X v10.5 and later, software that runs on earlier versions of OS X must use Quartz or Core Image to draw gradient fills. Quartz supports the creation of both radial and axial gradients in different color spaces using a mathematical computation function you provide. The use of a mathematical function means that the gradients you create using Quartz scale well to any resolution. Core Image, on the other hand, provides filters for creating a fixed-resolution image consisting of a radial, axial, or Gaussian gradient. Because the end result is an image, however, Core Image gradients may be less desirable for PDF and other print-based drawing.

To draw a Quartz shading in your Cocoa program, you would do the following from your drawRect: method:

Get a CGContextRef using the graphicsPort method of NSGraphicsContext. (You will pass this reference to other Quartz functions.)
Create a CGShadingRef using Quartz; see Gradients in Quartz 2D Programming Guide.
Configure the current clipping path to the desired shape for your shading; see Setting the Clipping Region.
Draw the shading using CGContextDrawShading.
For information on using Core Image to create images with gradient fills, see Core Image Programming Guide.


*/