import UIKit

class ViewBarBack<A>:ViewBar<A> where A.C:Controller<A>
{
    private(set) weak var buttonBack:UIButton!
    
    override func factoryViews()
    {
        super.factoryViews()
        
        self.factoryBackButton()
    }
    
    //MARK: private
    
    private func factoryBackButton()
    {
        let buttonBack:UIButton = UIButton()
        buttonBack.translatesAutoresizingMaskIntoConstraints = false
        buttonBack.setImage(
            #imageLiteral(resourceName: "assetGenericBack").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        buttonBack.setImage(
            #imageLiteral(resourceName: "assetGenericBack").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        buttonBack.imageView!.tintColor = UIColor.colourBackgroundGray
        buttonBack.imageView!.clipsToBounds = true
        buttonBack.imageView!.contentMode = UIViewContentMode.center
        buttonBack.addTarget(
            self,
            action:#selector(self.selectorButtonBack(sender:)),
            for:UIControlEvents.touchUpInside)
        self.buttonBack = buttonBack
        
        self.addSubview(buttonBack)
        
        NSLayoutConstraint.topToTop(
            view:buttonBack,
            toView:self,
            constant:ViewGlobal.Constants.contentTop)
        NSLayoutConstraint.bottomToBottom(
            view:buttonBack,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:buttonBack,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonBack,
            constant:ViewGlobal.Constants.barBackWidth)
    }
    
    //MARK: internal
    
    @objc
    func selectorButtonBack(sender button:UIButton) { }
}
