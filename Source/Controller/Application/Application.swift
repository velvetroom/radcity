import UIKit

@UIApplicationMain
internal final class Application:UIResponder, UIApplicationDelegate {
    internal var window:UIWindow?
    
    internal func startPresentation() {
        let presenter:Presenter = Application.factoryPresenter()
        let initialPresentation:PresentationProtocol = Application.factoryInitialPresentation()
        self.window = Application.factoryWindow()
        self.window?.rootViewController = presenter
        presenter.present(presentation:initialPresentation)
    }
    
    private class func factoryWindow() -> UIWindow {
        let window:UIWindow = UIWindow(frame:UIScreen.main.bounds)
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
        
        return  window
    }
}
