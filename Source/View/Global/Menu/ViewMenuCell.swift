import UIKit

final class ViewMenuCell:ViewCollectionCell
{
    private weak var imageView:UIImageView!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView = imageView
        
        self.addSubview(imageView)
        
        NSLayoutConstraint.equals(
            view:imageView,
            toView:self)
    }
    
    override func showHighlighted()
    {
        super.showHighlighted()
        
        self.imageView.tintColor = UIColor.colourBackgroundDark
    }
    
    override func showReleased()
    {
        super.showReleased()
        
        self.imageView.tintColor = UIColor.colourBackgroundDark.withAlphaComponent(0.2)
    }
    
    //MARK: internal
    
    func config(model:MenuItemProtocol)
    {
        self.imageView.image = model.icon.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        self.showState()
    }
}
