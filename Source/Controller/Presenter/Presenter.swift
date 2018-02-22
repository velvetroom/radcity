import UIKit

final class Presenter:UIViewController, PresenterProtocol
{
    var orientation:UIInterfaceOrientationMask
    
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
}
