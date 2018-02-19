import UIKit

final class ViewBorder:UIView
{
    init(colour:UIColor)
    {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.isUserInteractionEnabled = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = colour
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
