import UIKit

internal extension PresentationProtocol {
    internal weak var view:UIView? {
        get {
            return self.controller?.view
        }
    }
    
    internal mutating func factoryUI() {
        let controllerType:ControllerProtocol.Type = self.model.controllerType
        self.controller = controllerType.viewController
    }
}
