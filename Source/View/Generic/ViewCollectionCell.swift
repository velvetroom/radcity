import UIKit

class ViewCollectionCell:UICollectionViewCell
{
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        
        self.factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override var isSelected:Bool
    {
        didSet
        {
            self.showState()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            self.showState()
        }
    }
    
    //MARK: internal
    
    final func showState()
    {
        if self.isSelected || self.isHighlighted
        {
            self.showHighlighted()
        }
        else
        {
            self.showReleased()
        }
    }
    
    func factoryViews() { }
    
    func showReleased() { }
    
    func showHighlighted() { }
}
