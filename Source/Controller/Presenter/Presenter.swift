import UIKit

internal final class Presenter:UIViewController, PresenterProtocol {
    internal var orientation:UIInterfaceOrientationMask
    
    internal init() {
        self.orientation = UIInterfaceOrientationMask.portrait
        super.init(nibName:nil, bundle:nil)
    }
    
    internal required init?(coder:NSCoder) {
        return nil
    }
    
    internal override func loadView() {
        let viewPresenter:ViewPresenter = ViewPresenter()
        self.view = viewPresenter
    }
}
