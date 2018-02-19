import UIKit

extension ViewParent:UIGestureRecognizerDelegate
{
    private var gestureRouters:[UIGestureRecognizerState:((CGPoint, CGFloat) -> ())]
    {
        get
        {
            let map:[UIGestureRecognizerState:((CGPoint, CGFloat) -> ())] = [
                UIGestureRecognizerState.began : self.gestureStateBegan,
                UIGestureRecognizerState.possible : self.gestureStateBegan,
                UIGestureRecognizerState.changed : self.gestureStateChanged,
                UIGestureRecognizerState.cancelled : self.gestureStateEnded,
                UIGestureRecognizerState.ended : self.gestureStateEnded,
                UIGestureRecognizerState.failed : self.gestureStateEnded]
            
            return map
        }
    }
    
    //MARK: selectors
    
    @objc
    private func selectorPanRecognized(sender panGesture:UIPanGestureRecognizer)
    {
        let location:CGPoint = panGesture.location(in:self)
        let xPos:CGFloat = location.x
        
        guard
        
            let router:((CGPoint, CGFloat) -> ()) = self.gestureRouters[panGesture.state]
        
        else
        {
            return
        }
        
        router(location, xPos)
    }
    
    //MARK: private
    
    private func gesturePanTo(deltaX:CGFloat)
    {
        var useDeltaX:CGFloat = deltaX
        
        if useDeltaX < 0
        {
            useDeltaX = 0
        }
        
        guard
            
            let topView:ViewTransitionableProtocol = self.subviews.last as? ViewTransitionableProtocol
            
        else
        {
            return
        }
        
        topView.layoutLeft.constant = useDeltaX
    }
    
    private func gesturePop()
    {
        self.panRecognizer.isEnabled = true
        self.controller.pop(horizontal:ControllerTransition.Horizontal.right)
    }
    
    private func gestureRestore()
    {
        self.panRecognizer.isEnabled = true
        
        guard
            
            let topView:ViewTransitionableProtocol = self.subviews.last as? ViewTransitionableProtocol
            
        else
        {
            return
        }
        
        topView.layoutLeft.constant = 0
        
        UIView.animate(withDuration:ViewGlobal.Constants.animationDuration)
        {
            self.layoutIfNeeded()
        }
    }
    
    //MARK: internal
    
    func factoryGesture()
    {
        let panRecognizer:UIPanGestureRecognizer = UIPanGestureRecognizer(
            target:self,
            action:#selector(self.selectorPanRecognized(sender:)))
        
        panRecognizer.delegate = self
        self.panRecognizer = panRecognizer
        
        self.addGestureRecognizer(panRecognizer)
    }
    
    func gestureStateBegan(
        location:CGPoint,
        xPos:CGFloat)
    {
        UIApplication.shared.keyWindow?.endEditing(true)
        
        if xPos < ViewParent.Constants.panningMaxX
        {
            self.panningX = xPos
        }
    }
    
    func gestureStateChanged(
        location:CGPoint,
        xPos:CGFloat)
    {
        guard
            
            let panningX:CGFloat = self.panningX
            
        else
        {
            return
        }
        
        let deltaX:CGFloat = xPos - panningX
        
        guard
            
            deltaX < ViewParent.Constants.panningMaxXDelta
            
        else
        {
            self.panRecognizer.isEnabled = false
            
            return
        }
        
        self.gesturePanTo(deltaX:deltaX)
    }
    
    func gestureStateEnded(
        location:CGPoint,
        xPos:CGFloat)
    {
        guard
            
            let panningX:CGFloat = self.panningX
            
        else
        {
            self.panningX = nil
            
            return
        }
        
        let deltaX:CGFloat = xPos - panningX
        
        if deltaX > ViewParent.Constants.panningMinXDelta
        {
            self.gesturePop()
        }
        else
        {
            self.gestureRestore()
        }
        
        self.panningX = nil
    }
    
    //MARK: gestureRecognizerDelegate
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer:UIGestureRecognizer) -> Bool
    {
        guard
            
            let view:ViewTransitionableProtocol = self.subviews.last as? ViewTransitionableProtocol
            
        else
        {
            return false
        }
        
        let shouldPanBack:Bool = view.shouldPanBack
        
        return shouldPanBack
    }
}
