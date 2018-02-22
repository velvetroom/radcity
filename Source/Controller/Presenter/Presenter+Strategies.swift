import UIKit

internal extension Presenter
{
    //MARK: internal
    
    internal func strategyInitial(presentation:PresentationProtocol)
    {
        self.addView(presentation:presentation)
        self.layoutStrategyInitial(presentation:presentation)
    }
    
    //MARK: private
    
    private func layoutStrategyInitial(presentation:PresentationProtocol)
    {
        guard
            
            var view:ViewProtocol = presentation.view as? ViewProtocol
            
        else
        {
            return
        }
        
        view.presentationLayout.layoutTop = presentation.view?.layoutTopToTop(view:self.view)
    }
}
