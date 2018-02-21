import UIKit

final class ViewAlert:UIView
{
    private weak var layoutTop:NSLayoutConstraint?
    private weak var timer:Timer?
    
    private class var topView:UIView?
    {
        get
        {
            return UIApplication.shared.keyWindow?.rootViewController?.view
        }
    }
    
    //MARK: internal
    
    class func messageFail(message:String)
    {
        ViewAlert.message(
            message:message,
            color:UIColor.colourFail)
    }
    
    class func messageSuccess(message:String)
    {
        ViewAlert.threadSafeMessage(
            message:message,
            color:UIColor.colourSuccess)
    }
    
    //MARK: private
    
    private class func threadSafeMessage(
        message:String,
        color:UIColor)
    {
        DispatchQueue.main.async
        {
            ViewAlert.message(
                message:message,
                color:color)
        }
    }
    
    private class func message(
        message:String,
        color:UIColor)
    {
        let alert:ViewAlert = ViewAlert(
            message:message,
            color:color)
        
        ViewAlert.topView?.addSubview(alert)
        ViewAlert.messageLayout(alert:alert)
        alert.animateOpen()
    }
    
    private class func messageLayout(alert:ViewAlert)
    {
        guard
            
            let topView:UIView = ViewAlert.topView
        
        else
        {
            return
        }
        
        alert.layoutTop = alert.layoutTopToTop(
            view:topView,
            constant:-ViewAlert.Constants.height)
        alert.layoutEqualsHorizontal(view:topView)
        alert.layoutHeight(constant:ViewAlert.Constants.height)
        
        topView.layoutIfNeeded()
    }
    
    private convenience init(
        message:String,
        color:UIColor)
    {
        self.init()
        self.clipsToBounds = true
        self.backgroundColor = color
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let label:UILabel = ViewAlert.factoryMessageLabel(message:message)
        let button:UIButton = ViewAlert.factoryButton()
        
        self.addSubview(label)
        self.addSubview(button)
        self.layoutMessage(label:label)
    }
    
    private func layoutMessage(label:UILabel)
    {
        label.layoutTopToTop(
            view:self,
            constant:ViewAlert.Constants.labelTop)
        label.layoutBottomToBottom(view:self)
        label.layoutEqualsHorizontal(
            view:self,
            margin:ViewAlert.Constants.labelMargin)
    }
    
    private func scheduleTimer()
    {
        self.timer = Timer.scheduledTimer(
            timeInterval:ViewAlert.Constants.timeOut,
            target:self,
            selector:#selector(self.selectorAlertTimeOut(sender:)),
            userInfo:nil,
            repeats:false)
    }
    
    private func animateOpen()
    {
        self.layoutTop?.constant = 0
        
        self.animateLayout
        { [weak self] in
            
            self?.scheduleTimer()
        }
    }
    
    private func animateClose()
    {
        self.layoutTop?.constant = -ViewAlert.Constants.height
        
        self.animateLayout
        { [weak self] in
            
            self?.removeFromSuperview()
        }
    }
    
    private func animateLayout(completion:@escaping(() -> ()))
    {
        UIView.animate(withDuration:ViewAlert.Constants.animationDuration,
                       animations:
        { [weak self] in
            
            self?.superview?.layoutIfNeeded()
        })
        { (done:Bool) in
           
            completion()
        }
    }
    
    //MARK: selectors
    
    @objc
    func selectorActionButton(sender button:UIButton)
    {
        button.isUserInteractionEnabled = false
        self.timer?.invalidate()
        self.selectorAlertTimeOut(sender:timer)
    }
    
    @objc
    private func selectorAlertTimeOut(sender timer:Timer?)
    {
        timer?.invalidate()
        self.animateClose()
    }
}
