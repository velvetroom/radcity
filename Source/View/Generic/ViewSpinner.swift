import UIKit

final class ViewSpinner:UIImageView
{
    init()
    {
        super.init(frame:CGRect.zero)
        self.isUserInteractionEnabled = false
        self.translatesAutoresizingMaskIntoConstraints = false
        self.clipsToBounds = true
        self.animationDuration = ViewSpinner.Constants.animationDuration
        self.animationImages = ViewSpinner.Constants.images
        self.contentMode = UIViewContentMode.center
        self.startAnimating()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
