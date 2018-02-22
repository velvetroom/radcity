import Foundation

internal extension Presenter
{
    //MARK: internal
    
    internal func present(presentation:PresentationProtocol)
    {
        let model = presentation.factoryModel()
    }
}
