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
        let model:ModelHome = Application.factoryModelHome()
        let presentation:PresentationInitial = PresentationInitial(model:model)
        
        return presentation
    }
    
    //MARK: private
    
    private class func factoryModelHome() -> ModelHome
    {
        let model:ModelHome = ModelHome()
        
        return model
    }
}
