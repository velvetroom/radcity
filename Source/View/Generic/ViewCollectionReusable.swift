import UIKit

class ViewCollectionReusable:UICollectionReusableView
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
    
    //MARK: internal
    
    func factoryViews() { }
}
