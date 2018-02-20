import UIKit

final class ViewAlert:UIView
{
    private weak var layoutTop:NSLayoutConstraint!
    private weak var timer:Timer?
    
    class func messageFail(message:String)
    {
        ViewAlert.message(message:message, color:UIColor.colourFail)
    }
    
    class func messageSuccess(message:String)
    {
        ViewAlert.message(message:message, color:UIColor.colourSuccess)
    }
    
    private class func message(message:String, color:UIColor)
    {
        DispatchQueue.main.async
        {
            ViewAlert.asyncMessage(message:message, color:color)
        }
    }
    
    private class func asyncMessage(message:String, color:UIColor)
    {
        let alert:ViewAlert = ViewAlert(
            message:message,
            color:color)
        
        let rootView:UIView = UIApplication.shared.keyWindow!.rootViewController!.view
        rootView.addSubview(alert)
        
        alert.layoutTop = NSLayoutConstraint.topToTop(
            view:alert,
            toView:rootView,
            constant:-ViewAlert.Constants.height)
        NSLayoutConstraint.equalsHorizontal(
            view:alert,
            toView:rootView)
        NSLayoutConstraint.height(
            view:alert,
            constant:ViewAlert.Constants.height)
        
        rootView.layoutIfNeeded()
        alert.animate(open:true)
    }
    
    private convenience init(message:String, color:UIColor)
    {
        self.init()
        self.clipsToBounds = true
        self.backgroundColor = color
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.medium(size:ViewAlert.Constants.fontSize)
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines = 0
        label.backgroundColor = UIColor.clear
        label.text = message
        
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.clear
        button.addTarget(
            self,
            action:#selector(self.selectorActionButton(sender:)),
            for:UIControlEvents.touchUpInside)
        
        self.addSubview(label)
        self.addSubview(button)
        
        NSLayoutConstraint.topToTop(
            view:label,
            toView:self,
            constant:ViewAlert.Constants.labelTop)
        NSLayoutConstraint.bottomToBottom(
            view:label,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self,
            margin:ViewAlert.Constants.labelMargin)
    }
    
    //MARK: selectors
    
    @objc
    private func selectorActionButton(sender button:UIButton)
    {
        button.isUserInteractionEnabled = false
        self.timer?.invalidate()
        self.selectorAlertTimeOut(sender:timer)
    }
    
    @objc
    private func selectorAlertTimeOut(sender timer:Timer?)
    {
        timer?.invalidate()
        self.animate(open:false)
    }
    
    //MARK: private
    
    private func scheduleTimer()
    {
        self.timer = Timer.scheduledTimer(
            timeInterval:ViewAlert.Constants.timeOut,
            target:self,
            selector:#selector(self.selectorAlertTimeOut(sender:)),
            userInfo:nil,
            repeats:false)
    }
    
    private func animate(open:Bool)
    {
        if open
        {
            self.layoutTop.constant = 0
        }
        else
        {
            self.layoutTop.constant = -ViewAlert.Constants.height
        }
        
        UIView.animate(withDuration:ViewAlert.Constants.animationDuration,
            animations:
        { [weak self] in
            
            self?.superview?.layoutIfNeeded()
        })
        { [weak self] (done:Bool) in
        
            if open
            {
                self?.scheduleTimer()
            }
            else
            {
                self?.removeFromSuperview()
            }
        }
    }
}
