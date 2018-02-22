import UIKit

internal final class Presenter:UIViewController, PresenterProtocol
{
    internal var orientation:UIInterfaceOrientationMask
    internal weak var viewPresenter:ViewPresenter?
    
    internal init()
    {
        self.orientation = UIInterfaceOrientationMask.portrait
        
        super.init(
            nibName:nil,
            bundle:nil)
    }
    
    internal required init?(coder:NSCoder)
    {
        return nil
    }
    
    internal override func loadView()
    {
        let viewPresenter:ViewPresenter = ViewPresenter()
        self.viewPresenter = viewPresenter
        self.view = viewPresenter
    }
}
