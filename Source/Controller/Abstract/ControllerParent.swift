import UIKit

final class ControllerParent:UIViewController
{
    var orientation:UIInterfaceOrientationMask
    let menu:Menu
    
    init()
    {
        self.menu = Menu()
        self.orientation = UIInterfaceOrientationMask.portrait
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        guard
            
            let controller:UIViewController = factorySelectedController()
            
        else
        {
            return
        }
        
        self.mainController(controller:controller)
    }
    
    override func loadView()
    {
        let viewParent:ViewParent = ViewParent(controller:self)
        self.view = viewParent
    }
}
