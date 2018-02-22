import UIKit

internal extension Application
{
    //MARK: internal
    
    internal class func factoryWindow() -> UIWindow
    {
        let window:UIWindow = UIWindow(frame:UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
        
        return  window
    }
    
    internal func application(
        _ application:UIApplication,
        didFinishLaunchingWithOptions launchOptions:[UIApplicationLaunchOptionsKey:Any]?) -> Bool
    {
        self.startPresentation()
        
        return true
    }
}
