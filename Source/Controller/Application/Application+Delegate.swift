import UIKit

extension Application
{
    //MARK: internal
    
    func application(
        _ application:UIApplication,
        didFinishLaunchingWithOptions launchOptions:
        [UIApplicationLaunchOptionsKey:Any]?) -> Bool
    {
        let window:UIWindow = UIWindow(frame:UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
        self.window = window
        
        let presenter:Presenter = Presenter()
        window.rootViewController = presenter
        
        return true
    }
}
