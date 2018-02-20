import UIKit

extension ControllerParent
{
    //MARK: private
    
    private func slide(
        controller:UIViewController,
        left:CGFloat)
    {
        guard
            
            let currentView:ViewTransitionableProtocol = self.currentView,
            let newView:ViewTransitionableProtocol = controller.view as? ViewTransitionableProtocol
            
        else
        {
            return
        }
        
        self.currentController?.removeFromParentViewController()
        self.addChildViewController(controller)
        controller.beginAppearanceTransition(true, animated:true)
        self.currentController?.beginAppearanceTransition(false, animated:true)
        
        self.viewParent?.slide(
            currentView:currentView,
            newView:newView,
            left:left)
        { [weak self] in
            
            controller.endAppearanceTransition()
            self?.currentController?.endAppearanceTransition()
        }
    }
    
    //MARK: internal
    
    func slideTo(
        transition:ControllerTransition,
        controller:UIViewController)
    {
        let viewWidth:CGFloat = -self.view.bounds.maxX
        let left:CGFloat = viewWidth * transition.horizontal
        
        self.slide(
            controller:controller,
            left:left)
    }
}
