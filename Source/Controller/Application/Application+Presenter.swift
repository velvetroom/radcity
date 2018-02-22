import Foundation

internal extension Application
{
    //MARK: internal
    
    internal class func factoryPresenter() -> Presenter
    {
        let presenter:Presenter = Presenter()
        
        return presenter
    }
}
