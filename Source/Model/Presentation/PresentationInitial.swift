import UIKit

internal struct PresentationInitial:PresentationProtocol {
    internal var controller:UIViewController?
    internal let model:ModelProtocol
    internal let presentationStrategy:((Presenter) -> (PresentationProtocol) -> ()) = Presenter.strategyInitial
    
    internal init(model:ModelProtocol) {
        self.model = model
        self.factoryUI()
    }
}
