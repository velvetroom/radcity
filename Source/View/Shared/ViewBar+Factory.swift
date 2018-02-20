import UIKit

extension ViewBar
{
    //MARK: internal
    
    class func factoryLabelTitle() -> UILabel
    {
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.isUserInteractionEnabled = false
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.font = UIFont.bold(size:ViewGlobal.Constants.barTitleFontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        
        return labelTitle
    }
}
