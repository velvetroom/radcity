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
    
    func mainController(controller:UIViewController)
    {
        self.addChildViewController(controller)
        
        guard
            
            let newView:ViewTransitionableProtocol = controller.view as? ViewTransitionableProtocol
            
        else
        {
            return
        }
        
        self.viewParent?.mainView(view:newView)
    }
    
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
    
    
    func push(
        controller:UIViewController,
        transition:ControllerTransition,
        background:Bool = true,
        completion:(() -> ())? = nil)
    {
        guard
            
            let viewParent:ViewParent = self.viewParent,
            let newView:ViewTransitionableProtocol = controller.view as? ViewTransitionableProtocol
            
        else
        {
            return
        }
        
        let width:CGFloat = viewParent.bounds.maxX
        let height:CGFloat = viewParent.bounds.maxY
        let left:CGFloat = width * transition.horizontal
        let top:CGFloat = height * transition.vertical
        
        self.pushController(
            controller:controller,
            newView:newView,
            left:left,
            top:top,
            background:background,
            completion:completion)
    }
    
    func animateOver(controller:UIViewController)
    {
        guard
            
            let newView:ViewTransitionableProtocol = controller.view as? ViewTransitionableProtocol
            
        else
        {
            return
        }
        
        self.addChildViewController(controller)
        controller.beginAppearanceTransition(true, animated:true)
        self.currentController?.beginAppearanceTransition(false, animated:true)
        
        self.viewParent?.animateOver(newView:newView)
        { [weak self] in
            
            controller.endAppearanceTransition()
            self?.currentController?.endAppearanceTransition()
        }
    }
    
    func centreOver(controller:UIViewController)
    {
        guard
            
            let newView:ViewTransitionableProtocol = controller.view as? ViewTransitionableProtocol
            
        else
        {
            return
        }
        
        self.addChildViewController(controller)
        controller.beginAppearanceTransition(true, animated:true)
        self.currentController?.beginAppearanceTransition(false, animated:true)
        self.viewParent?.centreOver(newView:newView)
        
        controller.endAppearanceTransition()
        self.currentController?.endAppearanceTransition()
    }
}
