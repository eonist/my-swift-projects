import Foundation
//continue here: create IPositionalGraphic, that uses mutating methods, the IPositional class shouldnt use mutating methods to avoid the problem with setting variables directly
protocol IPositional {
    var position:CGPoint{get set}
    func setPosition(position:CGPoint)
}
