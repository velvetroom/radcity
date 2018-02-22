import Foundation

extension Application
{
    //MARK: internal
    
    class func factoryPresenter() -> Presenter
    {
        let presenter:Presenter = Presenter()
        
        return presenter
    }
}
