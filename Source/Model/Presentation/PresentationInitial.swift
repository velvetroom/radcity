import UIKit

internal struct PresentationInitial:PresentationProtocol
{
    internal weak var view:UIView?    
    internal var controller:UIViewController?
    internal let model:ModelProtocol
    internal let presentationStrategy:((Presenter) -> (PresentationProtocol) -> ()) = Presenter.strategyInitial
    
    init(model:ModelProtocol)
    {
        self.model = model
        self.factoryUI()
    }
}
