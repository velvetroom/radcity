import UIKit

class ViewBar<A>:View<A> where A.C:Controller<A>
{
    weak var labelTitle:UILabel!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        self.backgroundColor = UIColor.white
        
        let viewBorder:ViewBorder = ViewBorder(colour:UIColor.colourBackgroundDark)
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.isUserInteractionEnabled = false
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.font = UIFont.bold(size:ViewGlobal.Constants.barTitleFontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        self.labelTitle = labelTitle
        
        self.addSubview(viewBorder)
        self.addSubview(labelTitle)
        
        NSLayoutConstraint.height(
            view:viewBorder,
            constant:ViewGlobal.Constants.borderWidth)
        NSLayoutConstraint.bottomToBottom(
            view:viewBorder,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBorder,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:labelTitle,
            toView:self,
            constant:ViewGlobal.Constants.contentTop)
        NSLayoutConstraint.bottomToBottom(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:self)
    }
}
