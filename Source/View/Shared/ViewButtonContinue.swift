import UIKit

final class ViewButtonContinue:UIButton
{
    init()
    {
        super.init(frame:CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        self.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        self.titleLabel!.font = UIFont.medium(size:ViewButtonContinue.Constants.fontSize)
        
        let backgroundImage:UIImageView = UIImageView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.clipsToBounds = true
        backgroundImage.contentMode = UIViewContentMode.center
        backgroundImage.isUserInteractionEnabled = false
        backgroundImage.image = #imageLiteral(resourceName: "assetGenericButton")
        
        self.addSubview(backgroundImage)
        self.sendSubview(toBack:backgroundImage)
        
        NSLayoutConstraint.equals(
            view:backgroundImage,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override var intrinsicContentSize:CGSize
    {
        get
        {
            let size:CGSize = CGSize(
                width:ViewButtonContinue.Constants.width,
                height:ViewButtonContinue.Constants.height)
            
            return size
        }
    }
}
