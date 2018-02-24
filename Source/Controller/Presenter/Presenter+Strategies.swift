import UIKit

internal extension Presenter {
    internal func strategyInitial(presentation:PresentationProtocol) {
        self.addView(presentation:presentation)
        self.layoutStrategyInitial(presentation:presentation)
    }
    
    private func layoutStrategyInitial(presentation:PresentationProtocol) {
        guard
            var view:ViewProtocol = presentation.view as? ViewProtocol
        else {
            return
        }
        view.presentationLayout.layoutTop = presentation.view?.layoutTopToTop(view:self.view)
        view.presentationLayout.layoutBottom = presentation.view?.layoutBottomToBottom(view:self.view)
        view.presentationLayout.layoutRight = presentation.view?.layoutRightToRight(view:self.view)
        view.presentationLayout.layoutLeft = presentation.view?.layoutLeftToLeft(view:self.view)
    }
}
