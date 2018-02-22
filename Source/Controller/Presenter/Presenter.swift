import UIKit

final class Presenter:UIViewController, PresenterProtocol
{
    var orientation:UIInterfaceOrientationMask
    weak var viewPresenter:ViewPresenter?
    
    init()
    {
        self.orientation = UIInterfaceOrientationMask.portrait
        
        super.init(
            nibName:nil,
            bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func loadView()
    {
        let viewPresenter:ViewPresenter = ViewPresenter()
        self.viewPresenter = viewPresenter
        self.view = viewPresenter
    }
}
