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
            
            let view:ViewProtocol = presentation.view as? ViewProtocol
            
        else
        {
            return
        }
        
        
    }
}
