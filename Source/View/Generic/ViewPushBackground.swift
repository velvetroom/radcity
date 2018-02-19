import UIKit

final class ViewPushBackground:UIView
{
    init()
    {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.backgroundColor = UIColor(white:0, alpha:0.6)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alpha = 0
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
