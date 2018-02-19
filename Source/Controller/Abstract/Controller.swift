import UIKit

class Controller<A>:UIViewController where A.M:Model<A>
{
    let model:A.M
    private(set) weak var viewMain:A.V!
    
    var parentController:ControllerParent?
    {
        get
        {
            guard
                
                let parent:ControllerParent = self.parent as? ControllerParent
                
            else
            {
                return nil
            }
            
            return parent
        }
    }
    
    init()
    {
        self.model = A.M()
        
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override var shouldAutorotate:Bool
    {
        get
        {
            return true
        }
    }
    
    override var preferredStatusBarStyle:UIStatusBarStyle
    {
        get
        {
            return UIStatusBarStyle.default
        }
    }
    
    override var prefersStatusBarHidden:Bool
    {
        get
        {
            return false
        }
    }
    
    override func loadView()
    {
        guard
            
            let controller:A.V.C = self as? A.V.C
        
        else
        {
            return
        }
        
        let genericView:A.V = A.V(controller:controller)
        self.viewMain = genericView
        
        let view:UIView? = genericView as? UIView
        self.view = view
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge()
        self.extendedLayoutIncludesOpaqueBars = false
        
        if #available(iOS 11.0, *)
        {
            self.additionalSafeAreaInsets = UIEdgeInsets.zero
        }
        else
        {
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    override func viewWillAppear(_ animated:Bool)
    {
        super.viewWillAppear(animated)
        
        self.parent?.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        let analytics:Analytics = Analytics()
        analytics.setScreen(controller:self)
    }
}
