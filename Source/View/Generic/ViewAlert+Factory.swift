import UIKit

extension ViewAlert
{
    //MARK: internal
    
    class func factoryMessageLabel(message:String) -> UILabel
    {
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.medium(size:ViewAlert.Constants.fontSize)
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines = 0
        label.backgroundColor = UIColor.clear
        label.text = message
        
        return label
    }
    
    class func factoryButton() -> UIButton
    {
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.clear
        button.addTarget(
            self,
            action:#selector(self.selectorActionButton(sender:)),
            for:UIControlEvents.touchUpInside)
        
        return button
    }
}
