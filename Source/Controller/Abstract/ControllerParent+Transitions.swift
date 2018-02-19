import UIKit

extension ControllerParent
{
    private var viewParent:ViewParent?
    {
        get
        {
            return self.view as? ViewParent
        }
    }
    
    private var currentView:ViewTransitionableProtocol?
    {
        get
        {
            return self.currentController.view as? ViewTransitionableProtocol
        }
    }
    
    private var currentController:UIViewController?
    {
        get
        {
            return self.childViewControllers.last
        }
    }
    
    //MARK: private
    
    private func slide(controller:UIViewController, left:CGFloat)
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
    
    private func removeUntil(index:Int)
    {
        var controllers:Int = self.childViewControllers.count - 1
        
        while controllers > index
        {
            controllers -= 1
            
            let controller:UIViewController = self.childViewControllers[controllers]
            controller.beginAppearanceTransition(false, animated:false)
            controller.view.removeFromSuperview()
            controller.endAppearanceTransition()
            controller.removeFromParentViewController()
        }
    }
    
    private func popController(
        index:Int,
        left:CGFloat,
        top:CGFloat)
    {
        let currentController:UIViewController = self.childViewControllers[index]
        let previousController:UIViewController = self.childViewControllers[index - 1]
        currentController.removeFromParentViewController()
        
        guard
            
            let currentView:ViewTransitionableProtocol = currentController.view as? ViewTransitionableProtocol
            
        else
        {
            return
        }
        
        currentController.beginAppearanceTransition(false, animated:true)
        previousController.beginAppearanceTransition(true, animated:true)
        
        self.viewParent?.pop(
            currentView:currentView,
            left:left,
            top:top)
        {
            previousController.endAppearanceTransition()
            currentController.endAppearanceTransition()
            
            completion?()
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
            
            let newView:ViewTransitionableProtocol = controller.view as? ViewTransitionableProtocol
            
        else
        {
            return
        }
        
        self.viewParent?.mainView(view:newView)
    }
    
    func push(
        controller:UIViewController,
        horizontal:ControllerTransition.Horizontal = ControllerTransition.Horizontal.none,
        vertical:ControllerTransition.Vertical = ControllerTransition.Vertical.none,
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
        let left:CGFloat = width * horizontal.rawValue
        let top:CGFloat = height * vertical.rawValue
        
        self.addChildViewController(controller)
        controller.beginAppearanceTransition(true, animated:true)
        self.currentController?.beginAppearanceTransition(false, animated:true)
        
        viewParent.push(
            newView:newView,
            left:left,
            top:top,
            background:background)
        { [weak self] in
            
            controller.endAppearanceTransition()
            self?.currentController?.endAppearanceTransition()
            
            completion?()
        }
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
        {
            controller.endAppearanceTransition()
            currentController.endAppearanceTransition()
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
            let index:Int = controllers - 1
            
            self.popController(
                index:index,
                left:left,
                top:top)
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
            
            let currentController:UIViewController = self.currentController,
            let previousController:UIViewController = self.childViewControllers.last
            
        else
        {
            return
        }
        
        currentController.removeFromParentViewController()
        currentController.beginAppearanceTransition(false, animated:true)
        previousController.beginAppearanceTransition(true, animated:true)
        
        self.viewParent?.dismissAnimateOver(currentView:currentController.view)
        {
            currentController.endAppearanceTransition()
            previousController.endAppearanceTransition()
            
            completion?()
        }
    }
}
