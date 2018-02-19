import UIKit

final class ViewHome:ViewMain<ArchHome>
{
    private(set) weak var viewBar:ViewHomeBar!
    private(set) weak var viewSpinner:ViewSpinner!
    private(set) weak var viewList:ViewHomeList!
    private(set) weak var viewFilter:ViewHomeFilter!
    private(set) weak var layoutFilterTop:NSLayoutConstraint!
    
    override func factoryViews()
    {
        super.factoryViews()
        self.backgroundColor = UIColor.colourBackgroundGray
        
        let viewBar:ViewHomeBar = ViewHomeBar(controller:self.controller)
        self.viewBar = viewBar
        
        let viewSpinner:ViewSpinner = ViewSpinner()
        self.viewSpinner = viewSpinner
        
        let viewList:ViewHomeList = ViewHomeList(controller:self.controller)
        viewList.isHidden = true
        self.viewList = viewList
        
        let viewFilter:ViewHomeFilter = ViewHomeFilter(controller:self.controller)
        self.viewFilter = viewFilter
        
        self.addSubview(viewList)
        self.addSubview(viewFilter)
        self.addSubview(viewSpinner)
        self.addSubview(viewBar)
        
        NSLayoutConstraint.equals(
            view:viewSpinner,
            toView:self)
        
        layoutFilterTop = NSLayoutConstraint.topToBottom(
            view:viewFilter,
            toView:viewBar,
            constant:-ViewHome.Constants.filterHeight)
        NSLayoutConstraint.height(
            view:viewFilter,
            constant:ViewHome.Constants.filterHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewFilter,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:viewList,
            toView:viewFilter)
        NSLayoutConstraint.bottomToBottom(
            view:viewList,
            toView:self,
            constant:-ViewGlobal.Constants.menuHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewList,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:ViewGlobal.Constants.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
    }
    
    deinit
    {
        self.viewSpinner.stopAnimating()
    }
}
