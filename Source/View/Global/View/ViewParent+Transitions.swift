import UIKit

extension ViewParent
{
    func centreOver(newView:ViewTransitionableProtocol)
    {
        guard
            
            let newUi:UIView = newView as? UIView
            
        else
        {
            return
        }
        
        self.addSubview(newUi)
        
        newView.layoutTop = NSLayoutConstraint.topToTop(
            view:newUi,
            toView:self)
        newView.layoutBottom = NSLayoutConstraint.bottomToBottom(
            view:newUi,
            toView:self)
        newView.layoutLeft = NSLayoutConstraint.leftToLeft(
            view:newUi,
            toView:self)
        newView.layoutRight = NSLayoutConstraint.rightToRight(
            view:newUi,
            toView:self)
        
        self.layoutIfNeeded()
    }
    
    func pop(
        currentView:ViewTransitionableProtocol,
        left:CGFloat,
        top:CGFloat,
        completion:@escaping(() -> ()))
    {
        guard
            
            let currentUi:UIView = currentView as? UIView
            
        else
        {
            return
        }
        
        currentView.layoutRight.constant = left
        currentView.layoutLeft.constant = left
        
        if top > 0
        {
            currentView.layoutBottom.constant = top
            currentView.layoutTop.constant = top
        }
        else
        {
            currentView.layoutTop.constant = top
            currentView.layoutBottom.constant = top
        }
        
        UIView.animate(withDuration:ViewGlobal.Constants.animationDuration,
        animations:
        {
            self.layoutIfNeeded()
            currentView.pushBackground?.alpha = 0
        })
        { (done:Bool) in
            
            currentView.pushBackground?.removeFromSuperview()
            currentUi.removeFromSuperview()
            completion()
        }
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
