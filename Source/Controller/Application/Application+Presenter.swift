import Foundation

internal extension Application
{
    //MARK: internal
    
    internal class func factoryPresenter() -> Presenter
    {
        let presenter:Presenter = Presenter()
        
        return presenter
    }
    
    internal class func factoryInitialPresentation() -> PresentationProtocol
    {
        let controller:ControllerHome = ControllerHome()
        let presentation:PresentationInitial = PresentationInitial(controller:controller)
        
        return presentation
    }
}
