import UIKit

extension ViewParent
{
    //MARK: private
    
    private func alignSlidingView(
        newView:ViewTransitionableProtocol,
        newUi:UIView,
        left:CGFloat)
    {
        self.insertSubview(newUi, belowSubview:self.viewMenu)
        
        newView.layoutTop = NSLayoutConstraint.topToTop(
            view:newUi,
            toView:self)
        newView.layoutBottom = NSLayoutConstraint.bottomToBottom(
            view:newUi,
            toView:self)
        newView.layoutRight = NSLayoutConstraint.rightToRight(
            view:newUi,
            toView:self,
            constant:-left)
        newView.layoutLeft = NSLayoutConstraint.leftToLeft(
            view:newUi,
            toView:self,
            constant:-left)
        
        self.layoutIfNeeded()
    }
    
    private func slideRight(transition:ViewParentSlideTransition)
    {
        transition.currentView.layoutRight.constant = transition.left
        transition.currentView.layoutLeft.constant = transition.left
        transition.newView.layoutRight.constant = 0
        transition.newView.layoutLeft.constant = 0
     
        self.slideCompletion(transition:transition)
    }
    
    private func slideLeft(transition:ViewParentSlideTransition)
    {
        transition.currentView.layoutLeft.constant = transition.left
        transition.currentView.layoutRight.constant = transition.left
        transition.newView.layoutLeft.constant = 0
        transition.newView.layoutRight.constant = 0
        
        self.slideCompletion(transition:transition)
    }
    
    private func slideCompletion(transition:ViewParentSlideTransition)
    {
        UIView.animate(withDuration:ViewGlobal.Constants.animationDuration,
                       animations:
        {
            self.layoutIfNeeded()
        })
        { (done:Bool) in
            
            transition.currentUi.removeFromSuperview()
            transition.completion?()
        }
    }
    
    //MARK: internal
    
    func mainView(view:ViewTransitionableProtocol)
    {
        guard
            
            let ui:UIView = view as? UIView
            
        else
        {
            return
        }
        
        self.insertSubview(ui, belowSubview:viewMenu)
        
        view.layoutTop = NSLayoutConstraint.topToTop(
            view:ui,
            toView:self)
        view.layoutBottom = NSLayoutConstraint.bottomToBottom(
            view:ui,
            toView:self)
        view.layoutLeft = NSLayoutConstraint.leftToLeft(
            view:ui,
            toView:self)
        view.layoutRight = NSLayoutConstraint.rightToRight(
            view:ui,
            toView:self)
    }
    
    func slide(
        currentView:ViewTransitionableProtocol,
        newView:ViewTransitionableProtocol,
        left:CGFloat,
        completion:@escaping(() -> ()))
    {
        guard
            
            let currentUi:UIView = currentView as? UIView,
            let newUi:UIView = newView as? UIView
            
        else
        {
            return
        }
        
        self.alignSlidingView(
            newView:newView,
            newUi:newUi,
            left:left)
        
        var transition:ViewParentSlideTransition = ViewParentSlideTransition(
            currentView:currentView,
            newView:newView,
            currentUi:currentUi)
        transition.left = left
        transition.completion = completion
        
        if left >= 0
        {
            self.slideRight(transition:transition)
        }
        else
        {
            self.slideLeft(transition:transition)
        }
    }
    
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
}
