import UIKit

extension ViewParent
{
    //MARK: private
    
    private func popLayout(transition:ViewParentPopTransition)
    {
        transition.currentView.layoutRight.constant = transition.left
        transition.currentView.layoutLeft.constant = transition.left
        
        if transition.top > 0
        {
            transition.currentView.layoutBottom.constant = transition.top
            transition.currentView.layoutTop.constant = transition.top
        }
        else
        {
            transition.currentView.layoutTop.constant = transition.top
            transition.currentView.layoutBottom.constant = transition.top
        }
    }
    
    private func popCompletion(transition:ViewParentPopTransition)
    {
        guard
            
            let currentUi:UIView = transition.currentView as? UIView
            
        else
        {
            return
        }
        
        UIView.animate(withDuration:ViewGlobal.Constants.animationDuration,
                       animations:
        {
            self.layoutIfNeeded()
            transition.currentView.pushBackground?.alpha = 0
        })
        { (done:Bool) in
            
            transition.currentView.pushBackground?.removeFromSuperview()
            currentUi.removeFromSuperview()
            transition.completion?()
        }
    }
    
    //MARK: internal
    
    func pop(
        currentView:ViewTransitionableProtocol,
        left:CGFloat,
        top:CGFloat,
        completion:@escaping(() -> ()))
    {
        var transition:ViewParentPopTransition = ViewParentPopTransition(currentView:currentView)
        transition.left = left
        transition.top = top
        transition.completion = completion
        
        self.popLayout(transition:transition)
        self.popCompletion(transition:transition)
    }
    
    func dismissAnimateOver(
        currentView:UIView,
        completion:@escaping(() -> ()))
    {
        UIView.animate(withDuration:ViewGlobal.Constants.animationDuration,
                       animations:
        { [weak currentView] in
            
            currentView?.alpha = 0
        })
        { [weak currentView] (done:Bool) in
            
            currentView?.removeFromSuperview()
            completion()
        }
    }
}
