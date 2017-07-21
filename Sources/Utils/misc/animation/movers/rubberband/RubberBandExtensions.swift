import Foundation

extension RubberBand{
    typealias Config = (/*This is the RubberBand config Signature*/
        friction:CGFloat,
        springEasing:CGFloat,
        spring:CGFloat,
        limit:CGFloat,
        epsilon:CGFloat
    )
    typealias Frame = (/*This is the Frame Signature, basically: (y, height) or (x, width) So that the springsolve can support horizontal and vertical orientation, but what about z?*/
        min:CGFloat,/*Basically topMargin when vertical, or leftMargin when horizontal*/
        len:CGFloat/*Basically height when vertical or width when horizontal*/
    )
}
