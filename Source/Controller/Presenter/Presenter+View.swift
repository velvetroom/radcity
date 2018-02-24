import UIKit

internal extension Presenter {
    internal func addView(presentation:PresentationProtocol) {
        guard
            let view:UIView = presentation.view
        else {
            return
        }
        self.view.addSubview(view)
    }
}
