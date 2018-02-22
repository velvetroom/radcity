import UIKit

internal final class ViewPresenter:UIView
{
    //MARK: internal
    
    internal init()
    {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.sharedBackgroundColour
    }
    
    internal required init?(coder:NSCoder)
    {
        return nil
    }
}
