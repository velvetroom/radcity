import UIKit

extension ViewParent
{
    func push(
        newView:ViewTransitionableProtocol,
        left:CGFloat,
        top:CGFloat,
        background:Bool,
        completion:@escaping(() -> ()))
    {
        if background
        {
            let pushBackground:ViewPushBackground = ViewPushBackground()
            newView.pushBackground = pushBackground
            
            self.addSubview(pushBackground)
            
            NSLayoutConstraint.equals(
                view:pushBackground,
                toView:self)
        }
        
        guard
            
            let newUi:UIView = newView as? UIView
        
        else
        {
            return
        }
        
        self.addSubview(newUi)
        
        newView.layoutTop = NSLayoutConstraint.topToTop(
            view:newUi,
            toView:self,
            constant:top)
        newView.layoutBottom = NSLayoutConstraint.bottomToBottom(
            view:newUi,
            toView:self,
            constant:top)
        newView.layoutLeft = NSLayoutConstraint.leftToLeft(
            view:newUi,
            toView:self,
            constant:left)
        newView.layoutRight = NSLayoutConstraint.rightToRight(
            view:newUi,
            toView:self,
            constant:left)
        
        self.layoutIfNeeded()
        
        if top >= 0
        {
            newView.layoutTop.constant = 0
            newView.layoutBottom.constant = 0
        }
        else
        {
            newView.layoutBottom.constant = 0
            newView.layoutTop.constant = 0
        }
        
        if left >= 0
        {
            newView.layoutLeft.constant = 0
            newView.layoutRight.constant = 0
        }
        else
        {
            newView.layoutRight.constant = 0
            newView.layoutLeft.constant = 0
        }
        
        UIView.animate(withDuration:ViewGlobal.Constants.animationDuration,
        animations:
        {
            self.layoutIfNeeded()
            newView.pushBackground?.alpha = 1
        })
        { (done:Bool) in
            
            completion()
        }
    }
    
    func animateOver(
        newView:ViewTransitionableProtocol,
        completion:@escaping(() -> ()))
    {
        guard
            
            let newUi:UIView = newView as? UIView
            
        else
        {
            return
        }
        
        newUi.alpha = 0
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
        completion()
        
        UIView.animate(withDuration:ViewGlobal.Constants.animationDuration)
        { [weak newUi] in
            
            newUi?.alpha = 1
        }
    }
    
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
