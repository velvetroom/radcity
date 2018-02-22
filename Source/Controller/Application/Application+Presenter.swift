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
        let presentation:PresentationInitial<ArchitectureHome> = PresentationInitial<ArchitectureHome>()
        
        return presentation
    }
}
