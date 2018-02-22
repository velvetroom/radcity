import UIKit

final class ViewPresenter:UIView
{
    init()
    {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.sharedBackgroundColour
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
