import UIKit

final class ViewMenu:UIView
{
    weak var collectionView:UICollectionView!
    private(set) weak var controller:ControllerParent!
    var cellSize:CGSize?
    
    init(controller:ControllerParent)
    {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let border:ViewBorder = ViewBorder(colour:UIColor.colourBackgroundDark)
        
        self.addSubview(border)
        
        NSLayoutConstraint.topToTop(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:ViewGlobal.Constants.borderWidth)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        self.factoryCollection()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
