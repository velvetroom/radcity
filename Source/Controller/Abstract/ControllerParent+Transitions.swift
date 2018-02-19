import UIKit

extension ControllerParent
{
    //MARK: private
    
    private func slide(controller:UIViewController, left:CGFloat)
    {
        guard
            
            let view:ViewParent = self.view as? ViewParent,
            let currentController:UIViewController = self.childViewControllers.last,
            let newView:ViewTransitionableProtocol = controller.view as? ViewTransitionableProtocol,
            let currentView:ViewTransitionableProtocol = currentController.view as? ViewTransitionableProtocol
            
        else
        {
            return
        }
        
        currentController.removeFromParentViewController()
        
        self.addChildViewController(controller)
        controller.beginAppearanceTransition(true, animated:true)
        currentController.beginAppearanceTransition(false, animated:true)
        
        view.slide(
            currentView:currentView,
            newView:newView,
            left:left)
        {
            controller.endAppearanceTransition()
            currentController.endAppearanceTransition()
        }
    }
    
    private func removeUntil(index:Int)
    {
        var controllers:Int = self.childViewControllers.count - 1
        
        while controllers > index
        {
            controllers -= 1
            
            let controller:UIViewController = self.childViewControllers[controllers]
            
            controller.beginAppearanceTransition(
                false,
                animated:false)
            
            controller.view.removeFromSuperview()
            controller.endAppearanceTransition()
            controller.removeFromParentViewController()
        }
    }
    
    //MARK: internal
    
    func slideTo(
        horizontal:ControllerTransition.Horizontal,
        controller:UIViewController)
    {
        let viewWidth:CGFloat = -self.view.bounds.maxX
        let left:CGFloat = viewWidth * horizontal.rawValue
        
        self.slide(
            controller:controller,
            left:left)
    }
    
    func mainController(controller:UIViewController)
    {
        self.addChildViewController(controller)
        
        guard
            
            let view:ViewParent = self.view as? ViewParent,
            let newView:ViewTransitionableProtocol = controller.view as? ViewTransitionableProtocol
            
        else
        {
            return
        }
        
        view.mainView(view:newView)
    }
    
    func push(
        controller:UIViewController,
        horizontal:ControllerTransition.Horizontal = ControllerTransition.Horizontal.none,
        vertical:ControllerTransition.Vertical = ControllerTransition.Vertical.none,
        background:Bool = true,
        completion:(() -> ())? = nil)
    {
        guard
            
            let view:ViewParent = self.view as? ViewParent,
            let currentController:UIViewController = self.childViewControllers.last,
            let newView:ViewTransitionableProtocol = controller.view as? ViewTransitionableProtocol
            
        else
        {
            return
        }
        
        let width:CGFloat = view.bounds.maxX
        let height:CGFloat = view.bounds.maxY
        let left:CGFloat = width * horizontal.rawValue
        let top:CGFloat = height * vertical.rawValue
        
        self.addChildViewController(controller)
        
        controller.beginAppearanceTransition(
            true,
            animated:true)
        
        currentController.beginAppearanceTransition(
            false,
            animated:true)
        
        view.push(
            newView:newView,
            left:left,
            top:top,
            background:background)
        {
            controller.endAppearanceTransition()
            currentController.endAppearanceTransition()
            completion?()
        }
    }
    
    func animateOver(controller:UIViewController)
    {
        guard
            
            let view:ViewParent = self.view as? ViewParent,
            let currentController:UIViewController = self.childViewControllers.last,
            let newView:ViewTransitionableProtocol = controller.view as? ViewTransitionableProtocol
            
        else
        {
            return
        }
        
        self.addChildViewController(controller)
        
        controller.beginAppearanceTransition(
            true,
            animated:true)
        
        currentController.beginAppearanceTransition(
            false,
            animated:true)
        
        view.animateOver(newView:newView)
        {
            controller.endAppearanceTransition()
            currentController.endAppearanceTransition()
        }
    }
    
    func centreOver(controller:UIViewController)
    {
        guard
            
            let view:ViewParent = self.view as? ViewParent,
            let currentController:UIViewController = self.childViewControllers.last,
            let newView:ViewTransitionableProtocol = controller.view as? ViewTransitionableProtocol
            
        else
        {
            return
        }
        
        self.addChildViewController(controller)
        
        controller.beginAppearanceTransition(
            true,
            animated:true)
        
        currentController.beginAppearanceTransition(
            false,
            animated:true)
        
        view.centreOver(newView:newView)
        
        controller.endAppearanceTransition()
        currentController.endAppearanceTransition()
    }
    
    func removeBetweenFirstAndLast()
    {
        self.removeUntil(index:1)
    }
    
    func removeAllButLast()
    {
        self.removeUntil(index:0)
    }
    
    func pop(
        horizontal:ControllerTransition.Horizontal = ControllerTransition.Horizontal.none,
        vertical:ControllerTransition.Vertical = ControllerTransition.Vertical.none,
        completion:(() -> ())? = nil)
    {
        let width:CGFloat = self.view.bounds.maxX
        let height:CGFloat = self.view.bounds.maxY
        let left:CGFloat = width * horizontal.rawValue
        let top:CGFloat = height * vertical.rawValue
        let controllers:Int = self.childViewControllers.count
        
        if controllers > 1
        {
            let currentController:UIViewController = self.childViewControllers[controllers - 1]
            let previousController:UIViewController = self.childViewControllers[controllers - 2]
            currentController.removeFromParentViewController()
            
            guard
                
                let view:ViewParent = self.view as? ViewParent,
                let currentView:ViewTransitionableProtocol = currentController.view as? ViewTransitionableProtocol
                
            else
            {
                return
            }
            
            currentController.beginAppearanceTransition(
                false,
                animated:true)
            
            previousController.beginAppearanceTransition(
                true,
                animated:true)
            
            view.pop(
                currentView:currentView,
                left:left,
                top:top)
            {
                previousController.endAppearanceTransition()
                currentController.endAppearanceTransition()
                
                completion?()
            }
        }
    }
    
    func popSilent(removeIndex:Int)
    {
        let controllers:Int = self.childViewControllers.count
        
        if controllers > removeIndex
        {
            let removeController:UIViewController = self.childViewControllers[removeIndex]
            
            guard
                
                let removeView:ViewTransitionableProtocol = removeController.view as? ViewTransitionableProtocol
                
            else
            {
                return
            }
            
            removeView.pushBackground?.removeFromSuperview()
            removeController.view.removeFromSuperview()
            removeController.removeFromParentViewController()
        }
    }
    
    func dismissAnimateOver(completion:(() -> ())?)
    {
        guard
            
            let view:ViewParent = self.view as? ViewParent,
            let currentController:UIViewController = self.childViewControllers.last
            
        else
        {
            return
        }
        
        currentController.removeFromParentViewController()
        
        guard
            
            let previousController:UIViewController = self.childViewControllers.last
            
        else
        {
            return
        }
        
        currentController.beginAppearanceTransition(
            false,
            animated:true)
        
        previousController.beginAppearanceTransition(
            true,
            animated:true)
        
        view.dismissAnimateOver(currentView:currentController.view)
        {
            currentController.endAppearanceTransition()
            previousController.endAppearanceTransition()
            
            completion?()
        }
    }
}
