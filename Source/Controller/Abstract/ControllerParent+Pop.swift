import UIKit

extension ControllerParent
{
    //MARK: private
    
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
    
    private func pop(transition:ControllerTransitionPop)
    {
        let currentController:UIViewController = self.childViewControllers[transition.index]
        let previousController:UIViewController = self.childViewControllers[transition.index - 1]
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
            left:transition.left,
            top:transition.top)
        {
            previousController.endAppearanceTransition()
            currentController.endAppearanceTransition()
            
            transition.completion?()
        }
    }
    
    //MARK: internal
    
    func removeBetweenFirstAndLast()
    {
        self.removeUntil(index:1)
    }
    
    func removeAllButLast()
    {
        self.removeUntil(index:0)
    }
    
    func pop(
        transition:ControllerTransition,
        completion:(() -> ())? = nil)
    {
        let width:CGFloat = self.view.bounds.maxX
        let height:CGFloat = self.view.bounds.maxY
        let left:CGFloat = width * transition.horizontal
        let top:CGFloat = height * transition.vertical
        let controllers:Int = self.childViewControllers.count
        
        if controllers > 1
        {
            let index:Int = controllers - 1
            
            var transition:ControllerTransitionPop = ControllerTransitionPop()
            transition.left = left
            transition.top = top
            transition.index = index
            transition.completion = completion
            
            self.pop(transition:transition)
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
