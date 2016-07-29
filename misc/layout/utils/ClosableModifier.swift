import Foundation

class ClosableModifier {
    /**
     *
     */
    class func closeAll(scope:*) {
        if(scope as DisplayObjectContainer){ scope = DisplayObjectParser.childrenOfType(scope, IClosable)}
        else if((scope is Array) == false)  {throw new IllegalOperationError(scope+" type not supported")}
        let sub
        for closable : IClosable in scope{ closable.close()}
    }
}
