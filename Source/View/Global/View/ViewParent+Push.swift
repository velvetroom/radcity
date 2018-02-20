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
    
    private func slideRight(
        currentView:ViewTransitionableProtocol,
        newView:ViewTransitionableProtocol,
        left:CGFloat,
        completion:@escaping(() -> ()))
    {
        currentView.layoutRight.constant = left
        currentView.layoutLeft.constant = left
        newView.layoutRight.constant = 0
        newView.layoutLeft.constant = 0
     
        self.slideCompletion(completion:completion)
    }
    
    private func slideLeft(
        currentView:ViewTransitionableProtocol,
        newView:ViewTransitionableProtocol,
        left:CGFloat,
        completion:@escaping(() -> ()))
    {
        currentView.layoutLeft.constant = left
        currentView.layoutRight.constant = left
        newView.layoutLeft.constant = 0
        newView.layoutRight.constant = 0
        
        self.slideCompletion(completion:completion)
    }
    
    private func slideCompletion(completion:@escaping(() -> ()))
    {
        UIView.animate(withDuration:ViewGlobal.Constants.animationDuration,
                       animations:
        {
            self.layoutIfNeeded()
        })
        { (done:Bool) in
            
            currentUi.removeFromSuperview()
            completion()
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
        
        if left >= 0
        {
            
        }
        else
        {
            self.slideLeft(
                currentView:currentUi, newView: <#T##ViewTransitionableProtocol#>, left: <#T##CGFloat#>, completion: <#T##(() -> ())##(() -> ())##() -> ()#>)
        }
    }
}
