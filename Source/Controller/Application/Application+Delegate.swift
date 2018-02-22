import UIKit

internal extension Application
{
    //MARK: internal
    
    internal func application(
        _ application:UIApplication,
        didFinishLaunchingWithOptions launchOptions:[UIApplicationLaunchOptionsKey:Any]?) -> Bool
    {
        let presenter:Presenter = Application.factoryPresenter()
        self.window = Application.factoryWindow()
        self.window?.rootViewController = presenter
        
        presenter.presentCentered(controller: <#T##Controller<Architecture>#>)
        
        return true
    }
    
    //MARK: private
    
    private class func factoryWindow() -> UIWindow
    {
        let window:UIWindow = UIWindow(frame:UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
        
        return  window
    }
}
