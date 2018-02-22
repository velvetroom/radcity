import UIKit

extension Application
{
    //MARK: internal
    
    func application(
        _ application:UIApplication,
        didFinishLaunchingWithOptions launchOptions:
        [UIApplicationLaunchOptionsKey:Any]?) -> Bool
    {
        self.window = self.factoryWindow()
        self.window?.rootViewController = self.factoryPresenter()
        
        return true
    }
    
    //MARK: private
    
    private func factoryWindow() -> UIWindow
    {
        let window:UIWindow = UIWindow(frame:UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
        
        return  window
    }
}
