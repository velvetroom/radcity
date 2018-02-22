import UIKit

internal struct PresentationInitial:PresentationProtocol
{
    internal weak var view:UIView?
    
    internal let model:ModelProtocol
    internal let presentation:((Presenter) -> (PresentationProtocol) -> ()) = Presenter.presentationInitial
    
    init(model:ModelProtocol)
    {
        self.model = model
    }
}
